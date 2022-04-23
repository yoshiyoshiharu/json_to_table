require_relative "test_helper"

class TableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JsonToTable::VERSION
  end

  def test_headings
    users = [
      { id: 1, name: 'TestUser1' },
      { id: 2, name: 'TestUser2' },
      { id: 3, name: 'TestUser3', email: 'test@test.com' }
    ]
    table = JsonToTable::Table.new(users)
    
    assert [:id, :name, :email], table.send(:headings)
  end

  def test_rows
    users = [
      { id: 1, name: 'TestUser1' },
      { id: 2, name: 'TestUser2' },
      { id: 3, name: 'TestUser3', email: 'test@test.com' }
    ]

    expected_array = [
      [1, 'TestUser1', nil],
      [2, 'TestUser2', nil],
      [3, 'TestUser3', 'test@test.com'],
    ]
    table = JsonToTable::Table.new(users)

    assert_equal expected_array, table.send(:rows)
  end
end
