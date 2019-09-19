class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook]



  def self.new_with_session(params, session)

    puts ''
    puts ''
    puts ''
    puts ''
    print "IN NEW WITH SESSION IN NEW WITH SESSION IN NEW WITH SESSION"
    puts ''
    puts ''
    puts ''
    puts ''

    super.tap do |user|
      # if extra information was provided by facebook when user logged in, assign whatever comes in
      # session["devise.facebook_data"]["extra"]["raw_info"] to 'data' variable
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)

    puts ''
    puts ''
    puts ''
    puts ''
    print "IN FROM_OMNIAUTH IN FROM_OMNIAUTH IN FROM_OMNIAUTH"
    puts ''
    puts ''
    puts ''
    puts ''

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end

    user.confirmed_at = user.created_at

  end
  has_many :campaigns, dependent: :destroy
  has_many :comments

end
