require 'rspec/core'

module Capybara
  module Select2
    #
    # Select2 Choose
    #
    def select2_choose(id, options)
      page.execute_script %Q{
        i = $('#s2id_#{id} .select2-offscreen');
        i.trigger('keydown').val('#{options[:query]}').trigger('keyup');
      }

      within(:xpath, "/html/body/div[@id='select2-drop']") do
        find(".select2-result-label", :text => options[:choose]).click
      end
    end

    #
    # Select2 field click
    #
    def select2_field_click(field_id)
      page.execute_script %Q{
        i = $('#s2id_#{field_id} input');
        i.click();
      }
    end

    #
    # Select2 search without choose
    #
    def select2_search_without_choose(field, options)
      id = field.path.match(/.*input\[@id='(.*)'\].*/)[1]
      page.execute_script %Q{
        i = $('#s2id_#{id} input');
        i.click();
        i.trigger('keydown').val('#{options[:query]}').trigger('keyup');
      }
    end

    #
    # Select2 multiple choose
    #
    def select2_multiple_choose(field, options)
      options[:input_type] ||= "input"

      id = field.path.match(/.*#{options[:input_type]}\[@id='(.*)'\].*/)[1]
      page.execute_script %Q{
        i = $('#s2id_#{id} input');
        i.click();
        i.trigger('keydown').val('#{options[:query]}').trigger('keyup');
      }

      within(:xpath, "/html/body/div[@id='select2-drop']") do
        find(".select2-result-label", text: options[:choose]).click
      end
    end

  end
end

RSpec.configure do |c|
  c.include Capybara::Select2
end
