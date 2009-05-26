class ModelMailer < ActionMailer::Base
  
  def self.configure(&block)
    @configurations ||= {}
    configuration = configuration_from &block
    configure_model configuration.watched_model
    save_the configuration
  end  
  
  def self.after_create(model)
    model_name = model.class.name.underscore.to_sym
    configuration = @configurations[model_name]
    
    ModelMailer.deliver_notification_email configuration, model
  end

  def notification_email(configuration, model)
    recipients configuration.deliver_to
    body :model => model
  end

  
  private
  def self.save_the(configuration)
    @configurations[configuration.watched_model] = configuration
  end
  def self.configure_model(model_name)
    return if @configurations.has_key?(model_name)
    observe_model model_name
  end
  
  def self.configuration_from(&block)
    configuration = Configuration.new
    configuration.instance_eval &block
    configuration
  end
  
  def self.observe_model(model_name)
    model = model_name.to_s.camelize.constantize
    model.after_create ModelMailer
  end
  
  
  class Configuration
    attr_reader :deliver_to
    attr_reader :watched_model
    
    def model(model_name)
      @watched_model = model_name
    end
    def recipients(recipient)
      @deliver_to = recipient
    end
  end
end