Given /^the following configuration$/ do |table|
  configuration = table.hashes[0]
  ModelMailer.configure do
    recipients configuration[:recipient_email]
    model configuration[:model_to_watch]
  end
end

Given /^a new ContactForm with$/ do |form|
  @contact_form = ContactForm.new(form.hashes[0])
end

When /^I save the contact form$/ do
  @contact_form.save
end


