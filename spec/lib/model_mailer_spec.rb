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
    it "delivers an email" do
      ModelMailer.should_receive(:deliver_notification_email).with(anything, @contact)
      ModelMailer.after_create @contact
    end
    
    context "setting parameters on mail" do
      include EmailSpec::Helpers
      include EmailSpec::Matchers

      before(:each) do
        @configuration = mock("configuration", :deliver_to => @expected_recipient)
        @email = ModelMailer.deliver_notification_email(@configuration, @contact)
      end

      it "delivers to the recipient on the configuration" do
        @email.should deliver_to(@configuration.deliver_to)
      end
      
      it "passes the contact object into the mail" do
        @email.should have_text(/#{@contact}/)
      end
    end
  end

  context "rendering email according to model name" do
    include EmailSpec::Helpers
    include EmailSpec::Matchers
    before(:each) do
      @expected_recipient = expected_recipient = "corey@example.com"
      ModelMailer.configure do
        model :contact_form
        recipients expected_recipient
      end
      ModelMailer.configure do
        model :foo
        recipients expected_recipient
      end
      @configuration = mock("configuration", :deliver_to => @expected_recipient)
    end
    it "renders contact_form_delivery_notification for ContactForm" do
      contact = ContactForm.new
      @email = ModelMailer.deliver_notification_email(@configuration, contact)
      @email.should have_text(/Contact Email/)
    end
    it "renders foo_delivery_notification for Foo" do
      foo = Foo.new
      @email = ModelMailer.deliver_notification_email(@configuration, foo)
      @email.should have_text(/Foo Template/)
    end
  end
end