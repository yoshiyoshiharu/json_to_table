require 'json'

class JsonToTableShower
  def initialize(json)
    @json = JSON.parse(json)
  end

  def show
    puts @json
  end
end
