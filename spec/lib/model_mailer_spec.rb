require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ModelMailer do
  context "configuring" do
    it "can be configured" do
      ModelMailer.configure do
      end
    end
    it "configures the model" do
      Foo.should_receive(:after_create).with(ModelMailer)
      ModelMailer.configure do
        model :foo
      end
    end
    
    it "has a recipients configuration" do
      ModelMailer.configure do
        recipients "corey@example.com"
      end
    end
  end
end