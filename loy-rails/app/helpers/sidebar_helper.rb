module SidebarHelper
  #
  # Super Admin menu
  #
  def super_admin_menu_sub_items
    [
      {
        name: "Gabinetes",
        path:  dashboard_path,
        page_controller: "super_admin"
      },
      {
        name: "Lista de e-mails",
        path: emails_list_path,
        page_controller: "super_admin"
      }
    ]
  end

  #
  # User Office menu
  #
  def user_office_menu_sub_items(current_user)
    subitems = []

    if can? :edit, current_user.user_office
      subitems.concat([
        {name: "Configurações Gerais", path: user_office_path, page_controller: "user_offices" },
      ])
    end

    subitems.concat([
      {name: Office.title(:plural), path: offices_path, page_controller: "offices"},
      {name: Employee.title(:plural), path: employees_path, page_controller: "employees"},
      {name: Department.title(:plural), path: departments_path, page_controller: "departments"}
    ])

    subitems
  end

  #
  # Sidebar link
  #
  def sidebar_link(icon_name, item_name, path, badge = 0)
    link_text = content_tag(:span, item_name)
    link_text << content_tag(:span, badge, class: "badge") if badge > 0
    link_to(icon(icon_name, link_text), path)
  end

  #
  # Sidebar item for
  #
  # @resource_class: resource class instance, or raw String to be shown
  # @icon_name: font awesome icon suffix name (without 'fa-')
  # @options: valid options are
  #   path: link to resource_class item. Default: index for resource_class
  #   page_controller: string reference for item controller. Default: calculated from resource_class
  #   id: li item element id. Default: calculated from resource_class
  #   badge: integer badge to be shown inside li item element
  #   class: additional li item clases
  #
  def sidebar_item_for(resource_class, icon_name, options={})
    resource_str = resource_class.to_s.underscore.pluralize

    if resource_class.is_a? Class
      item_name = resource_class.title(:plural)
      menu_item_id = resource_class.model_name.plural
    else
      item_name = resource_class
    end

    options[:path] ||= send("#{resource_str}_path")
    options[:page_controller] ||= resource_str
    options[:id] ||= menu_item_id
    options[:badge] ||= 0

    if active?(options[:page_controller])
      content_tag(:li, id: options[:id], class: "active #{options[:class]}") do
        content_tag(:div, '', class: 'pointer') do
          content_tag(:div, '', class: 'arrow') +
          content_tag(:div, '', class: 'arrow_border')
        end +
        sidebar_link(icon_name, item_name, options[:path], options[:badge])
      end

    else
      content_tag(:li, id: options[:id], class: options[:class]) do
        sidebar_link(icon_name, item_name, options[:path], options[:badge])
      end
    end
  end

  #
  # Sidebar with subitems
  #
  def sidebar_with_subitems_for(resource_class, icon_name, options={})
    resource_str = resource_class.to_s.underscore.pluralize

    if resource_class.is_a? Class
      item_name = resource_class.title(:plural)
    else
      item_name = resource_class
    end

    options[:page_controller] ||= resource_str

    if active?(options[:page_controller])
      content_tag(:li, class: "active #{options[:class]}") do
        c = content_tag(:div, '', class: 'pointer') do
          content_tag(:div, '', class: 'arrow') +
          content_tag(:div, '', class: 'arrow_border')
        end +
        link_to(icon(icon_name, content_tag(:span, item_name)) + icon("chevron-down"), "#", class: "dropdown-toggle")

        options[:sub_items].each do |sub_item|
          c += content_tag(:ul, class: "active submenu") do
            content_tag(:li) do
              unless sub_item[:method] == :delete
                link_to sub_item[:name], sub_item[:path], class: active?(sub_item[:page_controller])
              else
                button_to sub_item[:name], sub_item[:path], method: :delete, class: "btn-link"
              end
            end
          end
        end
        c
      end

    else
      content_tag(:li, class:  options[:class]) do
        c = link_to(icon(icon_name, content_tag(:span, item_name)) + icon("chevron-down"), "#", class: "dropdown-toggle")

        options[:sub_items].each do |sub_item|
          c += content_tag(:ul, class: "submenu") do
            content_tag(:li) do
              unless sub_item[:method] == :delete
                link_to sub_item[:name], sub_item[:path]
              else
                button_to sub_item[:name], sub_item[:path], method: :delete, class: "btn-link"
              end
            end
          end
        end
        c
      end
    end
  end

end
