require "spec_helper"

RSpec.describe "Element display methods" do
  html <<-HTML
    <div id="shown"></div>
    <div id="hidden" style="display: none"></div>
  HTML

  async "hides an element" do
    element = Element.find('#shown')
    element.css('display').should == 'block'
    element.hide
    element.css('display').should == 'none'
  end

  async "shows an element" do
    element = Element.find('#hidden')
    element.css('display').should == 'none'
    element.show
    element.css('display').should == 'block'
  end

  async "toggles on a hidden element" do
    element = Element.find('#hidden')
    element.css('display').should == 'none'
    element.toggle
    element.css('display').should == 'block'
  end

  async "toggles off a displayed element" do
    element = Element.find('#shown')
    element.css('display').should == 'block'
    element.toggle
    element.css('display').should == 'none'
  end
end
