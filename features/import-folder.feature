Feature: Import folder

  As a user I should be able to import a folder into the app. Once the folder is added to the app, the contents can be
  managed by the app (i.e. notes can be added to the folder).

  Background:
    Given a user "Akeem"
    And there are folders on the filesystem
      | folder name | parent folder |
      | Journal     |               |
      | Ideas       | Journal       |

  Scenario: Adding an empty folder

    Given that the app can access the filesystem
    When "Akeem" imports the "Ideas" folder
    Then the folder "Ideas" should be added to the list of folders

  Scenario: Adding a folder with sub folders
    When "Akeem" imports the "Journal" folder
    Then the folder "Journals" should be added to the list of folders
    And the folder "Ideas" should be a sub folder of "Journals"
