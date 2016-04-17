module ButtonsHelper
  # Edit button
  def edit_button(resource, options={})
    options[:path_options] ||= {}
    options[:link_options] ||= {}
    options[:link_options][:class] ||= ""
    options[:link_options][:class]  += ' btn-flat edit_button'

    if can? :edit, [resource].flatten.last
      link_to icon(:edit, "<span>#{t(:edit).upcase}</span>"),
        edit_polymorphic_path(resource, options[:path_options]),
        options[:link_options]
    end
  end

  # New button
  def new_button(resource, options={})
    options[:path_options] ||= {}
    options[:link_options] ||= {}
    options[:link_options][:class] ||= ""
    options[:link_options][:class]  += ' btn-flat success new_button'
    options[:link_options][:label] ||= t("helpers.submit.create", model: [resource].flatten.last.title).mb_chars.upcase

    if can? :create, [resource].flatten.last
      link_to icon(:plus, "<span>#{options[:link_options][:label]}</span>"),
        new_polymorphic_path(resource, options[:path_options]),
        options[:link_options]
    end
  end

  # invite button
  def invite_button(resource, options={})
    options[:path_options] ||= {}
    options[:link_options] ||= {}
    options[:link_options][:class] ||= ""
    options[:link_options][:class]  += ' btn-flat success invite_button'
    options[:link_options][:label] ||= t("devise.invitations.new.header").mb_chars.upcase

    if can? :invite, [resource].flatten.last
      link_to icon("user-plus", "<span>#{options[:link_options][:label]}</span>"),
        new_user_invitation_path(options[:path_options]),
        options[:link_options]
    end
  end

  # Delete button
  def delete_button(resource, options={})
    options[:path_options] ||= {}
    options[:link_options] ||= {}
    options[:link_options][:class] ||= ""
    options[:link_options][:class]  += ' btn-flat danger delete_button'
    options[:link_options][:label] ||= icon(:times, "<span>#{t(:delete).upcase}</span>")

    if can? :destroy, resource
      link_to options[:link_options][:label],
        resource,
        {
          method: :delete,
          data: { confirm: "Você tem certeza que deseja excluir?" }
        }.merge(options[:link_options])
    end
  end

  # Submit button
  def submit_button(options={})
    options[:class] ||= ""
    options[:class]  += " btn-flat success btn-save submit_button"
    options[:type]    = :submit

    content_tag(:button, options) do
      icon('check', "<span>#{t(:save).upcase}</span>")
    end
  end

  # Cancel button
  def cancel_button(options={})
    options[:class] ||= ""
    options[:class]  += " btn-flat white cancel_button"
    link_to icon('arrow-left', "<span>#{t(:return).upcase}</span>"), :back, options
  end

  #
  # Views buttons
  #

  def default_form_buttons
    [cancel_button, submit_button]
  end

  def default_show_buttons_for(resource)
    [
      cancel_button,
      new_button(resource.class),
      edit_button(resource),
      delete_button(resource)
    ]
  end
end
