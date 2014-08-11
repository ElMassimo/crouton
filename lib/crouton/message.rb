module Crouton
  class Message
    attr_reader :type, :content, :duration

    DEFAULT_MESSAGE = 'Saved'
    CSS = { notice: :info, error: :danger, alert: :warning }

    def initialize(type=:info, content=DEFAULT_MESSAGE, duration: nil)
      @type, @content = type.to_sym, content
      @duration = duration || default_duration
    end

    def css
      CSS[@type] || @type
    end

    private

    def default_duration
      case css
      when :danger then 3000
      when :warning then 2000
      end
    end

    def self.to_proc
      ->(args){ new(*args) }
    end
  end
end
