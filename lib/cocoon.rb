require 'cocoon/view_helpers'

module Cocoon
  if defined? ::Rails::Engine
    class Engine < ::Rails::Engine

      config.before_initialize do
        if config.action_view.javascript_expansions
          config.action_view.javascript_expansions[:cocoon] = %w(cocoon)
        end
      end

      # configure our plugin on boot
      initializer "cocoon.initialize" do |app|
        ActionView::Base.send :include, Cocoon::ViewHelpers
      end

    end
  elsif defined? ::Rails::Railtie
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if config.action_view.javascript_expansions
          config.action_view.javascript_expansions[:cocoon] = %w(cocoon)
        end
      end

      # configure our plugin on boot
      initializer "cocoon.initialize" do |app|
        ActionView::Base.send :include, Cocoon::ViewHelpers
      end
    end
  end
end
