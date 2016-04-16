module StaticPagesControllerHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def ronaldo_nogueira_url
    "http://www.ronaldonogueira.com.br/"
  end
end
