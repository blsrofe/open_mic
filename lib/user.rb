require './lib/joke'

class User
  attr_reader :name,
              :jokes

  def initialize(name, jokes = [])
    @name = name
    @jokes = jokes
  end
end
