require 'json'
require 'table'

class JsonToTableDisplayer
  def initialize(json)
    @json = JSON.parse(json)
  end

  def run
    table = JsonToTable::Table.new(@json)

    puts "#{table.terminal_table}\n\n"

    table.child_hashes.each do |child_hash|
      key = child_hash.keys.first
      puts key
      puts "#{JsonToTable::Table.new(child_hash[key]).terminal_table}\n\n"
    end
  end
end
