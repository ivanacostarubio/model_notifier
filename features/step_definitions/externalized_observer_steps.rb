Given /^the following configuration$/ do |table|
  configuration = table.hashes[0]
  ModelMailer.configure do
    recipients configuration[:recipient_email]
    model configuration[:model_to_watch]
  end
end
