Given(/^a new visitor to the Nuvo website$/) do
  p = @browser.a(:title => "Connectivity")
  p.wait_until_present
  p.exist?
  assert(p)
end

When(/^the user clicks on the navigation (.*) and (.*)$/) do |tabs,ids|
  p = @browser.li(:class => "menu-item-#{ids}").a(:text => "#{tabs}")
  p.wait_until_present
  p.exist?
  assert(p)
  p.click
end

Then(/^the user is redirected to other (.*) in the website$/) do |areas|
  p = @browser.url
  p == "www.connectivity/#{areas}"
  assert(p)
end


When(/^the user mouses over Products and clicks (.*) and (.*)$/) do |link,ids|
  p = @browser.a(:class => "sf-with-ul", :text => "Products")
  p2 = @browser.li(:id => "menu-item-#{ids}").a(:text => "#{link}")
  x = p2.visible?
  puts x
  assert(x == false)
  p.wait_until_present
  p.exist?
  assert(p)
  p.when_present.hover
  Watir::Wait.until {p2.visible?}
  y = p2.visible?
  puts y
  assert(y)
  p2.click
end

Then(/^the user is redirected to the (.*) on the website$/) do |products|
  p = @browser.url
  p == "www.connectivity/#{products}"
  assert(p)
end


When(/^the user clicks on the 5\-Star Guide button$/) do
  p = @browser.a(:class => "hellobar_cta hb-button")
  p.wait_until_present
  p.exist?
  assert(p)
  p.click
end

Then(/^the user gets redirected to the 5\-Star guide landing page$/) do
  p = @browser.title
  p == "Fix Your Business’ Reputation: How to Respond the Right Way to Online Reviews"
  assert(p)
end

When(/^the user starts the request for Contact$/) do
  p = @browser.a(:text => "Contact")
  p.wait_until_present
  p.exist?
  assert(p)
  p.click
  
end

Then(/^the user can fill in contact info$/) do
  rng = rand(0..999)
  first_name="John.#{rng}"
  last_name="Smith.#{rng}"
  web_site="http://testplaces-#{rng}.com"
  company_name="Company-#{rng}"
  phone_number="909-#{rng}-3#{rng}"
  number_of_locations="#{rng}"
  first = @browser.text_field(:id => "FirstName")
  first.wait_until_present
  first.visible?
  first.exist?
  first.set "#{first_name}"
  last = @browser.text_field(:id => "LastName")
  last.set "#{last_name}"
  web = @browser.text_field(:id => "Website")
  web.set "#{web_site}"
  company = @browser.text_field(:id => "Company")
  company.set "#{company_name}"
  phone = @browser.text_field(:id => "Phone")
  phone.set "#{phone_number}"
  number = @browser.text_field(:id => "HubSpot_Inc__NumberofLocations__c")
  number.set "#{number_of_locations}"
  @browser.select(:id => "Original_Referrer_c").option(:value => "PPC")
  @browser.select(:id => "Industry").option(:value => "Advertising")
  @browser.button(:type => "submit", :text => "Contact Me")
  puts "First name     " + first_name
  puts "Last name      " + last_name
  puts "Website        " + web_site
  puts "Company name   " + company_name
  puts "Phone number   " + phone_number
  puts "Number of Locs " + number_of_locations
end

And(/^they are redirected to the Thank You page$/) do
  p = @browser.title
  p == "Thank You - Connectivity"
  assert(p)
end

Then(/^the user can fill in contact info with different (.*)$/) do |referrers|
  rng = rand(0..999)
  first_name="John.#{rng}"
  last_name="Smith.#{rng}"
  web_site="http://testplaces-#{rng}.com"
  company_name="Company-#{rng}"
  phone_number="909-#{rng}-3#{rng}"
  number_of_locations="#{rng}"
  first = @browser.text_field(:id => "FirstName")
  first.wait_until_present
  first.visible?
  first.exist?
  first.set "#{first_name}"
  last = @browser.text_field(:id => "LastName")
  last.set "#{last_name}"
  web = @browser.text_field(:id => "Website")
  web.set "#{web_site}"
  company = @browser.text_field(:id => "Company")
  company.set "#{company_name}"
  phone = @browser.text_field(:id => "Phone")
  phone.set "#{phone_number}"
  number = @browser.text_field(:id => "HubSpot_Inc__NumberofLocations__c")
  number.set "#{number_of_locations}"
  @browser.select(:id => "Original_Referrer_c").option(:value => "#{referrers}")
  @browser.select(:id => "Industry").option(:value => "Advertising")
  @browser.button(:type => "submit", :text => "Contact Me")
  puts "First name     " + first_name
  puts "Last name      " + last_name
  puts "Website        " + web_site
  puts "Company name   " + company_name
  puts "Phone number   " + phone_number
  puts "Number of Locs " + number_of_locations

end

When(/^the user navigates the site on the (.*)$/) do |footers|
  p = @browser.a(:text => "#{footers}")
  p.wait_until_present
  p.exist?
  assert(p)
  p.click
end