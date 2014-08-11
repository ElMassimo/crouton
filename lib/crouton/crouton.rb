require 'crouton/presenter'

module Crouton

  module Concern
    def render_crouton(options={})
      render partial: 'crouton/croutons', locals: { croutons: Presenter.new(options) }
    end
  end

  class Engine < Rails::Engine
    initializer :crouton_controller do
      ActionController::Base.class_eval do
        include Crouton::Concern
      end
    end
  end
end
