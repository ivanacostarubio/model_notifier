require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ModelMailer do
  context "when configuring" do
    it "can be configured with model and recipients" do
      ModelMailer.configure do
        model :foo
        recipients "corey@example.com"
      end
    end
  end
  
  
  
  context "saving the model" do
    before(:each) do
      @expected_recipient = expected_recipient = "corey@example.com"
      ModelMailer.configure do
        model :contact_form
        recipients expected_recipient
      end
      @contact = ContactForm.new
    end
    
    it "receives the model through the after_create hook" do
      ModelMailer.should_receive(:after_create).with(@contact)
      @contact.save
    end
  end

  context "delivering the mail" do
    before(:each) do
      @expected_recipient = expected_recipient = "corey@example.com"
      ModelMailer.configure do
        model :contact_form
        recipients expected_recipient
      end
      @contact = ContactForm.new
    end
    it "sets the recipient" do
      ModelMailer.should_receive(:recipients).with(@expected_recipient)
      ModelMailer.after_create @contact
    end
  end
  
end