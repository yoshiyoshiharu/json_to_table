require 'thor'
require 'json_to_table_displayer'

module JsonToTable
  class CLI < Thor
    desc 'show', 'show json as table, [argument] file_name'
    def show(json_file)
      JsonToTableDisplayer.new(File.read(json_file)).run
    end
  end
end
