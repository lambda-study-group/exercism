if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("bob.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule BobTest do
  use ExUnit.Case

  test "stating something" do
    assert Bob.hey("Tom-ay-to, tom-aaaah-to.") == "Whatever."
  end

  test "shouting" do
    assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
  end

  test "asking a question" do
    assert Bob.hey("Does this cryogenic chamber make me look fat?") == "Sure."
  end

  test "talking forcefully" do
    assert Bob.hey("Let's go make out behind the gym!") == "Whatever."
  end

  test "talking in capitals" do
    assert Bob.hey("This Isn't Shouting!") == "Whatever."
  end

  test "asking in capitals" do
    assert Bob.hey("THIS ISN'T SHOUTING?") == "Calm down, I know what I'm doing!"
  end

  test "shouting numbers" do
    assert Bob.hey("1, 2, 3 GO!") == "Whoa, chill out!"
  end

  test "shouting with special characters" do
    assert Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!"
  end

  test "shouting with no exclamation mark" do
    assert Bob.hey("I HATE YOU") == "Whoa, chill out!"
  end

  test "statement containing question mark" do
    assert Bob.hey("Ending with ? means a question.") == "Whatever."
  end

  test "silence" do
    assert Bob.hey("") == "Fine. Be that way!"
  end

  test "prolonged silence" do
    assert Bob.hey("  ") == "Fine. Be that way!"
  end

  test "only numbers" do
    assert Bob.hey("1, 2, 3") == "Whatever."
  end

  test "question with numbers" do
    assert Bob.hey("4?") == "Sure."
  end

  test "shouting in Russian" do
    assert Bob.hey("УХОДИ") == "Whoa, chill out!"
  end
end
