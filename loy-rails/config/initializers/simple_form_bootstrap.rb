# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = "alert alert-danger"
  config.button_class = "btn btn-default"
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :judge
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "control-label"

    b.use :input, class: "form-control"
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block" }
  end

  config.wrappers :vertical_file_input, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: "control-label"

    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block" }
  end

  config.wrappers :vertical_boolean, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: "div", class: "checkbox" do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block" }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label_input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block" }
  end

  config.wrappers :horizontal_form, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :judge
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
      ba.use :hint,  wrap_with: { tag: "p", class: "help-block" }
    end
  end

  config.wrappers :horizontal_file_input, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
      ba.use :hint,  wrap_with: { tag: "p", class: "help-block" }
    end
  end

  config.wrappers :horizontal_boolean, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |wr|
      wr.wrapper tag: "div", class: "checkbox" do |ba|
        ba.use :input
      end

      wr.use :error, wrap_with: { tag: "span", class: "help-block" }
      wr.use :hint,  wrap_with: { tag: "p", class: "help-block" }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
      ba.use :hint,  wrap_with: { tag: "p", class: "help-block" }
    end
  end

  config.wrappers :inline_form, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :judge
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "sr-only"

    b.use :input, class: "form-control"
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block" }
  end

  # Fake wrapper to use f.input and its addons instead of
  # f.input_field
  config.wrappers :inline, error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :judge
    b.use :input, class: "form-control"
    b.use :error, wrap_with: { tag: "span", class: "help-inline"  }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block"  }
  end

  config.wrappers :prepend_inline, error_class: "has_error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :judge
    b.wrapper tag: "div", class: "input-group" do |prepend|
      prepend.use :span, wrap_with: {class: "input-group-addon"}
      prepend.use :input, class: "form-control"
    end
    b.use :error, wrap_with: { tag: "span", class: "help-inline"  }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block"  }
  end

  config.wrappers :append_inline, error_class: "has_error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :judge
    b.wrapper tag: "div", class: "input-group" do |append|
      append.use :input, class: "form-control"
      append.use :span, wrap_with: {class: "input-group-addon"}
    end
    b.use :error, wrap_with: { tag: "span", class: "help-inline"  }
    b.use :hint,  wrap_with: { tag: "p", class: "help-block"  }
  end

  config.wrappers :prepend, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :judge
    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |input|
      input.wrapper tag: "div", class: "input-group" do |prepend|
        prepend.use :span, wrap_with: {class: "input-group-addon"}
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: "span", class: "help-block"  }
      input.use :error, wrap_with: { tag: "span", class: "help-inline"  }
    end
  end

  config.wrappers :append, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :judge
    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |input|
      input.wrapper tag: "div", class: "input-group" do |append|
        append.use :input
        append.use :span, wrap_with: {class: "input-group-addon"}
      end
      input.use :hint,  wrap_with: { tag: "span", class: "help-block"  }
      input.use :error, wrap_with: { tag: "span", class: "help-inline"  }
    end
  end

  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :horizontal_form
  config.wrapper_mappings = {
    boolean: :horizontal_boolean
  }
end
