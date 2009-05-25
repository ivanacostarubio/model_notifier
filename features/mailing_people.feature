Feature: Mailing a newly-created Person
  In order keep track of people registering
  As a owner of the website
  I want newly created people's information to be emailed to me

  Scenario Outline: Email gets sent
    Given the following Person
    | name   | email   | comment   |
    | <name> | <email> | <comment> |
    When I save the Person
    Then I should receive an email
    When I open the email
    Then I should see "user: <name>" in the email
    And I should see "email: <email>" in the email
    And I should see "comment: <comment>" in the email

  Examples:
    | name           | email                     | comment           |
    | joe            | joe@example.com           | hello, world      |
    | another person | email_address@example.com | what a great test |
  
  