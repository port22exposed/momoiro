defmodule MomoiroTest do
  use ExUnit.Case
  doctest Momoiro

  test "greets the world" do
    assert Momoiro.hello() == :world
  end
end
