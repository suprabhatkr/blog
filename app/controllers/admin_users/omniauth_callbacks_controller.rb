class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    logger.info "jsldkjflksdjfl;ks"
    logger.info request.env["omniauth.auth"]
    @admin_user = AdminUser.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @admin_user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "google_ouath2") if is_navigational_format?
    else
      logger.info "hello supra"
      logger.info request.env["omniauth.auth"]
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
      redirect_to new_admin_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end