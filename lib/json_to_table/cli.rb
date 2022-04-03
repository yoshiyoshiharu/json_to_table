require 'thor'
require 'json_to_table_shower'

module JsonToTable
  class CLI < Thor
    desc 'show', 'show json as table, [argument] file_name'
    def show(json_file)
      JsonToTableShower.new(File.read(json_file)).show
    end
  end
end
