Feature: Mailing a newly-created Person
  In order keep track of people registering
  As a owner of the website
  I want newly created people's information to be emailed to me

  Scenario: Email gets sent
    Given the following Person
    | name | email           | comment      |
    | joe  | joe@example.com | hello, world |
    When I save the Person
    Then I should receive an email
    When I open the email
    Then I should see "user: joe" in the email
    And I should see "email: joe@example.com" in the email
    And I should see "comment: hello, world" in the email
