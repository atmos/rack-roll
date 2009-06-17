require File.dirname(__FILE__) + '/spec_helper'

describe "rack-roll" do
  before(:each) do
    @env = Rack::MockRequest.env_for("/", :method => 'GET')
    @app = Rack::Roll.new(app)
  end

  it "should set the X-Never-Gonna-Give-You-Up HTTP header to \"Never gonna let you down\"" do
    response = @app.call(@env)
    response[0].should eql(200)
    response[1]['X-Never-Gonna-Give-You-Up'].should eql('Never gonna let you down')
    response[2].should eql('Word')
  end
end
