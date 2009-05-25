require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PersonMailer, "New person notification" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  
  before(:each) do
    PersonMailer.recipient_email = "corey@example.com"
    @email =  PersonMailer.create_new_person_notification("New H. Person", "new_person@example.com", "this is really cool")
  end
  
  it "delivers to the email passed in" do
    @email.should deliver_to("corey@example.com")
  end
end