Feature: View Note

  As a user I should be able to select a note and view the contents

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
    ---
    layout: post
    title: Some title
    ---
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

  Scenario: View basic note as markdown

    Given "Akeem" is in the markdown view
    When "Akeem" selects the note "hello-world.md"
    Then "Akeem" should see the contents of "hello-world.md"


  Scenario: View preview of note

    This should output the HTML rendered version of the markdown

    Given "Akeem" is in the markdown view
    When "Akeem" selects the note "hello-world.md"
    Then "Akeem" should see the contents of "hello-world.md"
      """
      <h1>Hello World</h1>
      <p>This is a test file</p>
      <h2>Section 1</h2>
      <p>Some Notes</p>
      """

  Scenario: View note with front matter as markdown

    The front matter should not be visible within the editor

    Given "Akeem" is in the markdown view
    When "Akeem" selects the note "alpha.md"
    Then "Akeem" should see the contents of "alpha.md"
    """
    # Alpha

    This is a test file

    ## Section 1

    - [ ] Something needs to be done
    - [x] Something was done

    """

  Scenario: Preview note with front matter

  The front matter should not be visible within the editor

    Given "Akeem" is in the markdown view
    When "Akeem" selects the note "alpha.md"
    Then "Akeem" should see the contents of "alpha.md"
    """
    <h1>Alpha</h1>
    <p>This is a test file</p>
    <h2>Section 1</h2>
    <ul>
      <li><input type="checkbox" />Something needs to be done</li>
      <li><input type="checkbox" checked />Something was done</li>
    </ul>
    """


  Scenario: View note on filesystem

    When "Akeem" selects the option to view note "alpha.md" on the filesystem
    Then "alpha.md" should be opened on the filesystem


