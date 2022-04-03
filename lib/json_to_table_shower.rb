require 'json'
require 'terminal-table'

class JsonToTableShower
  def initialize(json)
    @json = JSON.parse(json)
  end

  # arrayが来る前提の処理
  def run
    rows = []
    table = Terminal::Table.new headings: headings(@json), rows: rows

    puts table
  end

  def headings(array)
    headings = []

    array.each do |hash|
      headings = headings | hash.keys
    end

    headings
  end
end
