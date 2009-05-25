require 'spec/mocks'

Given /^the following Person$/ do |person|
  @person = Person.new(person.hashes[0])
end

When /^I save the Person$/ do
  @person.save!
end


