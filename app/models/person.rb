class Person < ActiveRecord::Base
  after_save :notify_new_person
  
  private
  def notify_new_person
    mail = PersonMailer.create_new_person_notification(self.name, self.email, self.comment)
    PersonMailer.deliver mail
  end
end
