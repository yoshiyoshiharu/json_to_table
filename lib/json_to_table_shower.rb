require 'json'
require 'table'

class JsonToTableShower
  def initialize(json)
    @json = JSON.parse(json)
  end

  def run
    table = JsonToTable::Table.new(@json).terminal_table

    puts table
  end
end
