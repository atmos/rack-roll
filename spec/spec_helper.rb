$TESTING=true
require 'pp'
require 'rubygems'
require 'rack'
require 'rack/mock'

$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require 'rack-roll'

Spec::Runner.configure do |config|
  def app
    @app ||= Rack::Builder.new do
      use Rack::Roll
      run lambda { |env| [200, env.merge({ 'Content-Type' => 'text/plain' }), 'Word' ] }
    end
  end
end
