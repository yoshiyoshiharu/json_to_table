require 'terminal-table'

module JsonToTable
  class Table
    attr_reader :child_hashes

    def initialize(json, parent_table = nil)
      if json.is_a? Hash
        @hashes = [json]
      else
        @hashes = json
      end

      @headings = headings
      @child_hashes = []
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
