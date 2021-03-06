Feature: knife vault update

  'knife vault update' is used to add clients, or administrators
  and to re-run the search query

  Scenario: add admin to a vault
    Given a local mode chef repo with nodes 'one,two,three' with admins 'alice,bob'
    And I create a vault item 'test/item' containing the JSON '{"foo": "bar"}' encrypted for 'one,two,three' with 'alice' as admin
    Then the vault item 'test/item' should be encrypted for 'one,two,three'
    And 'one,two,three' should be a client for the vault item 'test/item'
    And 'alice' should be an admin for the vault item 'test/item'
    And I can decrypt the vault item 'test/item' as 'alice'
    And I can't decrypt the vault item 'test/item' as 'bob'
    And I add 'bob' as an admin for the vault item 'test/item'
    Then 'alice,bob' should be an admin for the vault item 'test/item'
    And I can decrypt the vault item 'test/item' as 'alice'
    And I can decrypt the vault item 'test/item' as 'bob'
