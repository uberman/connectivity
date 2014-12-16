require 'cucumber'
require 'test/unit/assertions'
include Test::Unit::Assertions
require 'watir-webdriver'
require 'selenium-webdriver'
require 'webdriver-user-agent'
require 'minitest-extra-assertions'

def environment
  (ENV['ENVI'] ||= 'qa').downcase.to_sym
end

def browser
  (ENV['BROWSER'] ||= 'ff').downcase.to_sym
end



Before do |scenario|
  # p "Starting #{scenario}"
  if environment == :qa
    @browser = Watir::Browser.new :ff
    @browser.window.resize_to(1024,1000)
    @browser.goto "http://www.connectivity.com"
    @browser.send_keys :return
  elsif environment == :headless
    @browser = Watir::Browser.new :phantomjs
    @browser.goto "http://www.connectivity.com"
    @browser.send_keys :return
  elsif environment == :chrome
    @browser = Watir::Browser.new :chrome
    @browser.goto "http://www.connectivity.com"
    @browser.send_keys :return
  elsif environment == :droidphone
    driver = UserAgent.driver(:browser => "chrome", :agent => "Nexus", :orientation => "landscape")
    @browser = Watir::Browser.new driver
    @browser.goto "http://www.connectivity.com"
    @browser.send_keys :return
  elsif environment == :iphone
    driver = UserAgent.driver(:browser => "chrome", :agent => "iphone", :orientation => "landscape")
    @browser = Watir::Browser.new driver
    @browser.goto "http://www.connectivity.com"
    @browser.send_keys :return
  else
    @browser = Watir::Browser.new browser_name
    @browser.goto "http://qa1.atmysite.com:80"
    @browser.send_keys :return
  end
end

After do |scenario|
  @browser.close
end
