class ModelMailer
  def self.configure(&block)
    configuration = Configuration.new
    configuration.instance_eval &block
  end
  
  class Configuration
    def model(model_name)
      Foo.after_create ModelMailer
    end
    def recipients(recipient)
    end
  end
end