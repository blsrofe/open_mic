require './lib/joke'

class User
  attr_reader :name,
              :jokes

  def initialize(name, jokes = [])
    @name = name
    @jokes = jokes
  end

  def learn(joke)
    jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    @jokes.each do |joke|
      user.jokes << joke
    end
  end

  def learn_routine(file)
    File.readlines(file)[1..101].each do |joke|
      @jokes << joke
    end
  end
end
