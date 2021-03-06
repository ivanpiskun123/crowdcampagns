class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook, :github]

  has_many :campaigns, dependent: :destroy
  has_many :comments

  def self.new_with_session(params, session)
    super.tap do |user|
      # if extra information was provided by facebook when user logged in, assign whatever comes in
      # session["devise.facebook_data"]["extra"]["raw_info"] to 'data' variable
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.confirmed_at = Time.now # for without require confirmation this new user
    end
  end
end
