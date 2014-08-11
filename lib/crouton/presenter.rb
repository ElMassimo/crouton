require 'crouton/message'

module Crouton
  class Presenter
    attr_reader :placeholder, :messages
    delegate :each, to: :messages

    def initialize(messages, options={})
      @placeholder = options.delete(:placeholder) || '.crouton-placeholder'
      messages = from_hash(messages) if messages.is_a?(Hash)
      @messages = *messages
    end

    private

    def from_hash(messages)
      messages.delete_if {|name, msg| msg.blank? }

      if (errors = messages[:errors]).present?
        errors_to_messages(errors)
      else
        messages.map(&Message).presence || [Message.new]
      end
    end

    # Internal: Converts errors to an array of error messages.
    def errors_to_messages(errors)
      errors.full_messages.map {|error| Message.new(:error, error) }
    end
  end
end
