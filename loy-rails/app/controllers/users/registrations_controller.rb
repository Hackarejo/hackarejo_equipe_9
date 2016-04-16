class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  # POST /resource
  def create
    build_resource(sign_up_params)
    binding.pry

    if params[:userable] == "client"
      resource.initialize_as("client")
      # Client sign up
    elsif params[:userable] == "manager"
      resource.initialize_as("manager")
      # temp_shop = resource.create_store!
    end

    resource.save!

    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      # temp_shop.destroy if temp_store.present?
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  #def after_inactive_sign_up_path_for(resource)
  #  "/confirmacao-enviada?t=#{resource.user_token}"
  #end

  def after_sign_up_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in).push(:name)
    devise_parameter_sanitizer.for(:sign_up).push(:name).push(:userable)
    devise_parameter_sanitizer.for(:account_update).push(:name)
  end
end
