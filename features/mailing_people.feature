Feature: Mailing a newly-created Person
  In order keep track of people registering
  As a owner of the website
  I want newly created people's information to be emailed to me

  Scenario: New Person Getting Mailed
    Given a new Person
    When I save the Person
    Then the person's information should be given to ActionMailer
  
  
  
