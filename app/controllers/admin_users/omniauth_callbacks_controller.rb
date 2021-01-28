class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    logger.info request.env["omniauth.auth"] 
    @admin_user = AdminUser.from_omniauth(request.env["omniauth.auth"])
    puts @admin_user["email"]
    if @admin_user.persisted?
      sign_in_and_redirect @admin_user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Suprabhat's google_oauth2") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      # @admin_user = AdminUser.create!(email: @admin_user["extra"]["raw_info"]["email"]+".fb",password: @admin_user["uid"])
      # sign_in_and_redirect @admin_user, :event => :authentication 
      redirect_to admin_dashboard_url
    end
  end

  def failure
    redirect_to root_path
  end
end