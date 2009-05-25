class PersonMailer < ActionMailer::Base
  cattr_accessor :recipient_email
  
  
  def new_person_notification(name,email,comment)
    recipients PersonMailer.recipient_email
  end

end
