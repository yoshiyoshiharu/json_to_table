require 'json'
require 'table'

class JsonToTableDisplayer
  def initialize(json)
    @json = JSON.parse(json)
  end

  def run
    table = JsonToTable::Table.new(@json)

    puts table.terminal_table

    table.child_hashes.each do |child_hash|
      puts JsonToTable::Table.new(child_hash).terminal_table
    end
  end
end
