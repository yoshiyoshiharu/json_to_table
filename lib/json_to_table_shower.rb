require 'json'
require 'table'

class JsonToTableShower
  def initialize(json)
    @hashes = JSON.parse(json)
  end

  def run
    table = JsonToTable::Table.new(@hashes).terminal_table

    puts table
  end
end
