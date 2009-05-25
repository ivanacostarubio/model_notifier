require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PersonMailer, "New person notification" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  
  before(:each) do
    @our_email = "corey@example.com"
    PersonMailer.recipient_email = @our_email
    @email =  PersonMailer.create_new_person_notification("New H. Person", "new_person@example.com", "this is really cool")
  end
  
  it "delivers to our email" do
    @email.should deliver_to(@our_email)
  end
  
  it "has the user name" do
    @email.should have_text(/New H\. Person/)
  end
  
  it "has the email" do 
    @email.should have_text(/new_person@example.com/)
  end
  
  it "has the comment" do
    @email.should have_text(/this is really cool/)
  end
end