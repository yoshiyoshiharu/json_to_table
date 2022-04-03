require 'terminal-table'

module JsonToTable
  class Table
    def initialize(hashes)
      @hashes = hashes
      @headings = headings
      @rows = rows
    end
  
    def terminal_table
      Terminal::Table.new headings: @headings, rows: @rows
    end
  
    def headings
      headings = []
  
      @hashes.each do |hash|
        headings = headings | hash.keys
      end
  
      headings
    end
  
    def rows
      rows = []
  
      @hashes.each do |hash|
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
end
