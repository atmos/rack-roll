require 'rubygems'
gem 'rack'

module Rack
  class Roll
    def initialize(app)
      @app = app
    end

    def call(env)
      env['X-Never-Gonna-Give-You-Up'] = 'Never gonna let you down'
      @app.call(env)
    end
  end
end
