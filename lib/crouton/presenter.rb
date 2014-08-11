require 'crouton/message'

module Crouton
  class Presenter
    attr_reader :placeholder, :messages
    delegate :each, to: :messages

    def initialize(options={})
      @placeholder = options.delete(:placeholder) || '.crouton-placeholder'
      @messages = options[:messages] || messages_for(options).presence || [Message.new]
    end

    private

    def messages_for(options)
      messages = options.delete_if {|name, msg| msg.blank? }

      if (errors = messages[:errors]).present?
        errors_to_messages(errors)
      else
        messages.map(&Message)
      end
    end

    # Internal: Converts errors to an array of error messages.
    def errors_to_messages(errors)
      errors.full_messages.map {|error| Message.new(:error, error) }
    end
  end
end
