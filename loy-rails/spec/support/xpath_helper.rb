module XpathHelper
  #
  # Have success flash
  #
  def have_success_flash
    have_css "p.alert.alert-success.flash-message"
  end

  #
  # Click save button
  #
  def click_save_button
    find(".btn-save", match: :first).click
  end

  #
  # Have field error for
  #
  def have_field_error_for(field_id)
    have_xpath "//span[contains(@class, 'help-block') and contains(@for, '#{field_id}')]"
  end

  #
  # Clear form
  #
  def clear_form(options={})
    options[:form_id] ||= 'form'
    page.execute_script("
      $(':input','#{options[:form_id]}')
        .not(':button, :submit, :reset, :hidden')
        .val('')
        .removeAttr('checked')
        .removeAttr('selected');
    ")
  end

  #
  # Click link with text
  #
  def click_link_with_text(text)
    find(:xpath, "//a[text()='#{text}']").click
    wait_for_turbolinks
  end

  #
  # Click link containing text
  #
  def click_link_containing_text(text)
    find(:xpath, "//a[contains(text(),'#{text}')]").click
    wait_for_turbolinks
  end

  #
  # Click link with href
  #
  def click_link_with_href(href)
    find(:xpath, "//a[@href='#{href}']").click
    wait_for_turbolinks
  end

  def click_link_with_text_and_href(text, href)
    find(:xpath, "//a[text()='#{text}' and @href='#{href}']").click
    wait_for_turbolinks
  end

  #
  # Click delete with href
  #
  def click_delete_with_href(href, options={confirm: true})
    if options[:confirm]
      accept_confirm do
        find(:xpath, "//a[@href='#{href}' and @data-method='delete']").click
      end
    else
      dismiss_confirm do
        find(:xpath, "//a[@href='#{href}' and @data-method='delete']").click
      end
    end
  end

  #
  # Nested form id for
  #
  def nested_form_id_for(id_prefix, id_sufix="")
    if id_sufix.blank?
      page.evaluate_script(%Q{ $("[id^='#{id_prefix}']").attr("id") })
    else
      page.evaluate_script(%Q{
        $("input[id^='#{id_prefix}'][id$='#{id_sufix}']").attr("id")
      })
    end
  end

  #
  # Click tab
  #
  def click_tab(tab_ref)
    find(:xpath, "//a[@href='##{tab_ref}']").click
  end

  #
  # Save and open screenshot
  #
  def saos
    save_and_open_screenshot
  end

  #
  # Save and open page
  #
  def saop
    save_and_open_page
  end
end

RSpec.configure do |config|
  config.include XpathHelper
end
