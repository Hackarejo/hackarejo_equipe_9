module FormHelper
  def show_field(instance, field, options={})
    options[:type]   ||= :string
    options[:label]  ||= human_attr(instance.class, field)
    options[:value]  ||= instance.send(field)

    options[:value] = "#{options[:value]} #{options[:append]}"

    content_tag(:div, class: "form-group #{instance.class.model_name.singular}_#{field}") do
      content_tag(:label, options[:label], class: "col-sm-3 control-label") +

      if options[:type] == :string
        content_tag(:div, options[:value].html_safe, class: "col-sm-9 show-field")
      elsif options[:type] == :currency
        content_tag(:div, number_to_currency(options[:value]), class: "col-sm-9 show-field")
      elsif options[:type] == :boolean
        content_tag(:div, options[:value] ? "Sim" : "Não", class: "col-sm-9 show-field")
      elsif options[:type] == :text
        content_tag(:div, simple_format(options[:value]), class: "col-sm-9 show-field")
      end
    end
  end

  def form_date(date)
    date.present? ? l(date) : nil
  end

  def show_date_time(date_time)
    date_time.present? ? date_time.strftime('%d/%m/%Y - %H:%Mh') : nil
  end

  def show_date(date_time)
    date_time.present? ? date_time.strftime('%d/%m/%Y') : nil
  end

  def show_time(date_time)
    date_time.present? ? date_time.strftime('%H:%Mh') : nil
  end

  def confirm_message_for(input_name)
    "Você deseja excluir #{input_name}?"
  end
end
