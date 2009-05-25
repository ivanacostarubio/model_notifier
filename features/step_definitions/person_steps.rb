Given /^the following Person$/ do |person|
  @person = Person.new(person.hashes[0])
end
