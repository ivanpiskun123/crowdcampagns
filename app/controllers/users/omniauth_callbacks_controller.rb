class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    puts ''
    puts ''
    puts ''
    puts @user.inspect
    puts ''
    puts ''
    puts ''
    print "AFTER FROM_OMNIAUTH AFTER FROM_OMNIAUTH AFTER FROM_OMNIAUTH"
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
      puts ''
      puts ''
      puts ''
      puts ''
      print "ELSE PERSISTED ELSE PERSISTED ELSE PERSISTED ELSE PERSISTED "
      puts ''
      puts ''
      puts ''
      puts ''


      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url

      puts ''
      puts ''
      puts ''
      puts ''
      print "HERE HERE HERE HERE HERE"
      puts ''
      puts ''
      puts ''
      puts ''


    end
  end

  def failure
    puts ''
    puts ''
    puts ''
    puts ''
    print "FAILTURE FAILTURE FAILTURE"
    puts ''
    print request.env["omniauth.auth"]
    puts ''
    puts ''
    puts ''
    redirect_to root_path
  end
end
