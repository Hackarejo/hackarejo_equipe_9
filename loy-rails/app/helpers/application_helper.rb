module ApplicationHelper
  #
  # Human attributes
  #
  def human_enum(model, enum, item )
    I18n.t("activerecord.attributes.#{model.model_name.singular}.#{enum}.#{item}")
  end

  def human_attr(model, attribute_name)
    model.human_attribute_name attribute_name
  end

  #
  # Icon helper
  #
  def icon(name, label='', options={})
    options[:class] ||= ''
    "<i class='fa fa-#{name} #{options[:class]}'></i> #{label}".html_safe
  end

  #
  # Left menu active status
  #
  def active?(page_controller)
    page_controller = [page_controller] unless page_controller.is_a? Array
    "active" if page_controller.include? params[:controller]
  end

  #
  # Contact e-mail
  #
  def contact_email
    "contato@gabineteintegrado.com.br"
  end

  #
  # Whodunnit link
  #
  def whodunnit_link(version)
    return "(sem registro)" if version.blank?

    if version.user.present?
      link_to version.user.name, version.user.employee
    else
      "#{version.user_name} (usuário removido)"
    end
  end
end
