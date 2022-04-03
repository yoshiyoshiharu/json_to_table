require 'json'
require 'terminal-table'

class JsonToTableShower
  def initialize(json)
    @json = JSON.parse(json)
    @headings = headings(@json)
  end

  # arrayが来る前提の処理
  def run
    table = Terminal::Table.new headings: headings(@json), rows: rows(@json)

    puts table
  end

  def headings(hashes)
    headings = []

    hashes.each do |hash|
      headings = headings | hash.keys
    end

    headings
  end

  def rows(hashes)
    rows = []

    hashes.each do |hash|
      row = []

      @headings.each do |key|
        if hash[key].is_a? Array || Hash
          row << '...'
        else
          row << hash[key]
        end
      end

      rows << row
    end

    rows
  end
end
