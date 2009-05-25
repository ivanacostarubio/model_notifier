Feature: Mailing a newly-created Person
  In order keep track of people registering
  As a owner of the website
  I want newly created people's information to be emailed to me

  Scenario: New Person Getting Mailed
    Given the following Person
    | name | email           | comment      |
    | joe  | joe@example.com | hello, world |
    When I save the Person
    Then I should receive an email
  
  
  
