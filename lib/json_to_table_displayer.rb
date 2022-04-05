require 'json'
require 'table'

class JsonToTableDisplayer
  def initialize(json)
    @json = JSON.parse(json)
  end

  def run
    table = JsonToTable::Table.new(@json)

    table.print_terminal_table

    table.child_hashes.each do |child_hash|
      key = child_hash.keys.first
      puts "\n#{key}"

      child_table = JsonToTable::Table.new(child_hash[key])
      child_table.print_terminal_table
      table.child_hashes.concat child_table.child_hashes
    end
  end
end
