require "test_helper"

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
end
