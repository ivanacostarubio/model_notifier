require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do
  before(:each) do
    @valid_attributes = {
      :name => 'test',
      :email => 'test@example.com',
      :comment => 'this is a comment'
    }
  end

  describe "when saving" do
    before(:each) do
      @person = Person.new(@valid_attributes)
      
      @mail = mock('person_notification')
      PersonMailer.stub!(:create_new_person_notification).and_return(@mail)
      PersonMailer.stub!(:deliver)
    end
    it "should create a new person notification" do
      PersonMailer.should_receive(:create_new_person_notification).with(
                          @valid_attributes[:name],
                          @valid_attributes[:email],
                          @valid_attributes[:comment]
                          )
      @person.save!
      
    end
    
    it "delivers the email" do
      PersonMailer.should_receive(:deliver).with(@mail)
      @person.save!      
    end
  end

end
