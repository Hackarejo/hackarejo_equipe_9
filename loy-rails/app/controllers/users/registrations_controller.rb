class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.initialize_as(params[:user_type])
    resource.save
    @user = resource

    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)

        respond_to do |format|
          format.html { respond_with resource, location: after_sign_up_path_for(resource) }
          format.json { render "users/show" }
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_data_after_sign_in!

        respond_to do |format|
          format.html { respond_with resource, location: after_inactive_sign_up_path_for(resource) }
          format.json { render "users/show" }
        end
      end
    else
      resource.clean_up_associations
      clean_up_passwords resource

      respond_to do |format|
        format.html { respond_with resource }
        format.json { render "users/show" }
      end
    end
  end

  protected

  #def after_inactive_sign_up_path_for(resource)
  #  "/confirmacao-enviada?t=#{resource.user_token}"
  #end

  def after_sign_up_path_for(resource)
    root_path
  end
end
