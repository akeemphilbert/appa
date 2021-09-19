Feature: List notes

  As a user I should be able to see a list of notes when I select a folder

  Background:
    Given a user "Akeem"
    And there are folders on the filesystem
      | folder name | parent folder |
      | Journal     |               |
      | Ideas       | Journal       |
    And the folder "Ideas" has a file "hello-world.md"
    And the file "hello-world.md" was created "2021-09-19T12:48:00Z"
    And the file "hello-world.md" has contents
    """
    # Hello World

    This is a test file

    ## Section 1

    Some Notes
    """
    And the folder "Ideas" has a file "hello-world.md"
    And the file "alpha.md" was created "2021-09-19T13:48:00Z"
    And the file "alpha.md" has contents
    """
    # Alpha

    This is a test file

    ## Section 1

    - [ ] Something needs to be done
    - [x] Something was done

    """
    And the folder "Ideas" has a file "foo.txt"
    And the file "foo.txt" has contents
    """
    Some content
    """


  Scenario: View folder with markdown files

    By default the items should be sorted by created date

    When "Akeem" selects the "Ideas" folder
    Then "Akeem" should see a list of markdown files
    | file        |  summary                  |
    | hello-world |                           |
    | alpha       | 1 out of 2 items complete |

  Scenario: View folder with sub folders and markdown files
    Given the folder "Journal" has a file "Some File.md"
    And the file "Some File.md" has contents
    """
    # Some Entry

    This is a test file

    ## Section 1

    Some Notes
    """
    When "Akeem" selects the "Ideas" folder
    Then "Akeem" should see a list of markdown files
      | file        |
      | Some Entry  |

  Scenario: List notes by alphabetical order
    Given "Akeem" selects the "Ideas" folder
    And "Akeem" sorts the notes list by "Alpha"
    Then "Akeem" should see a list of markdown files
      | file        | summary                   |
      | alpha       | 1 out of 2 items complete |
      | hello-world |                           |



