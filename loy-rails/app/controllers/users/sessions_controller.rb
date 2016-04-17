class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    @user = resource

    set_flash_message(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?

    respond_to do |format|
      format.html {
        respond_with resource, location: after_sign_in_path_for(resource)
      }

      format.json {
        render "users/show"
      }
    end
  end
end
