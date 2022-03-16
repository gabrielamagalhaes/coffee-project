defmodule CoffeeProjectTest do
  use ExUnit.Case
  doctest CoffeeProject

  test "greets the world" do
    assert CoffeeProject.hello() == :world
  end
end
