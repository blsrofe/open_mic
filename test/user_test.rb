require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/emoji'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")
    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")
    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")
    assert_equal "Ali", ali.name
  end

  def test_it_has_no_jokes_when_created
    sal = User.new("Sal")
    assert_equal [], sal.jokes()
  end

  def test_it_can_learn_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)
    assert_equal [joke], sal.jokes
  end

  def test_can_tell_jokes_to_others
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.tell(ali, joke)
    assert_equal [joke], ali.jokes
    assert_equal 1, ali.jokes.count
  end

  def test_it_can_perform_a_routine
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)
    assert_equal [joke_1, joke_2], josh.jokes
    assert_equal 2, josh.jokes.count
  end

end
