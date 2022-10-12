@javascript @theme_classic_unitec_tepukenga_dark
Feature: Add a block using classic_unitec_tepukenga_dark theme
  In order to check the blocks to display in the Add a block list for a them
  As an administrator
  I need to confirm the unaddableblocks setting is empty for classic_unitec_tepukenga_dark.

  Background:
    Given the following "courses" exist:
      | fullname | shortname |
      | Course 1 | C1        |
    And I log in as "admin"

  Scenario: All the expected blocks are displayed in the Add a block list for classic_unitec_tepukenga_dark
    Given I am on "Course 1" course homepage with editing mode on
    When I click on "Add a block" "select"
    Then I should see "Administration"
    And I should see "Navigation"
    And I should see "Courses"
    And I should see "Section links"

  Scenario: Admins can change unaddable blocks using the unaddableblocks setting for classic_unitec_tepukenga_dark
    Given the following config values are set as admin:
      | unaddableblocks | online_users,private_files,settings | theme_classic_unitec_tepukenga_dark|
    And I am on "Course 1" course homepage with editing mode on
    When I click on "Add a block" "select"
    Then I should not see "Online users"
    And I should not see "Private files"
    # The settings block is defined as required block for classic_unitec_tepukenga_dark, so it will be displayed always.
    And I should see "Administration"
    And I should see "Navigation"
    And I should see "Courses"
    And I should see "Section links"
