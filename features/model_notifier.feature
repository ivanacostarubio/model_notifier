Feature: Externalized Observer for notifying on model creation
  In order to use the email notifier for model creation
  As a developer of a webapp
  I want to have the externalized notifier be configured and send me an email


  Background:
    And the following configuration
    | recipient_email   | model_to_watch | subject      |
    | corey@example.com | :contact_form  | test subject |


  Scenario: Getting an email for a Contact Form
    Given a new ContactForm with
    | name | comment        |
    | ivan | please help me |

    When I save the contact form
    Then I should receive an email
    When I open the email
    Then I should see "test subject" in the subject
  
  
  
