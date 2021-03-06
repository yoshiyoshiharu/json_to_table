require 'terminal-table'

module JsonToTable
  class Table
    attr_reader :child_hashes

    def initialize(object, parent_table = nil)
      if object.is_a? Hash
        @hashes = [object]
      else
        @hashes = object
      end

      @child_hashes = []
      @headings = headings
      @rows = rows
    end
  
    def terminal_table
      Terminal::Table.new headings: @headings, rows: @rows
    end

    private
  
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
          if (hash[key].is_a? Hash) || (hash[key].is_a? Array)
            row << "... (#{rows.count + 1})"
            @child_hashes << { "#{key} (#{rows.count + 1})" => hash[key] }
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
