class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    puts ''
    puts ''
    puts ''
    puts ''
    print "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts ''
    print request.env["omniauth.auth"]
    puts ''
    puts ''
    puts ''


    if @user.persisted?
      puts ''
      puts ''
      puts ''
      puts ''
      print "22222222222222222222222222222222222222222222222222"
      puts ''
      puts ''
      puts ''
      puts ''
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else

      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    puts ''
    puts ''
    puts ''
    puts ''
    print "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts ''
    print request.env["omniauth.auth"]
    puts ''
    puts ''
    puts ''
    redirect_to root_path
  end
end
