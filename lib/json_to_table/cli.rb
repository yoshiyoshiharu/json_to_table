require 'thor'

module JsonToTable
  class CLI < Thor
    desc 'show', 'show json as table, [argument] file_name'
    def show(json_file)
      JsonToTable.new(json_file)
    end
  end
end
