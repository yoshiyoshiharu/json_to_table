require 'json'
require 'table'

class JsonToTableDisplayer
  def initialize(json)
    @json = JSON.parse(json)
    @table = JsonToTable::Table.new(@json)
  end

  def run
    @table.print_terminal_table

    print_terminal_child_tables
  end

  def print_terminal_child_tables
    @table.child_hashes.each do |child_hash|
      key = child_hash.keys.first
      puts "\n#{key}"

      child_table = JsonToTable::Table.new(child_hash[key])
      child_table.print_terminal_table
      @table.child_hashes.concat child_table.child_hashes
    end
  end
end
