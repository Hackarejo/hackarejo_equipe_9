module SimpleForm
  module Components
    module Span

      def span(wrapper_options = nil)
        @span ||= begin
          "<span>#{options[:span]}</span>".html_safe
        end
      end

      def has_span?
        options[:span] != false && span.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Span)
