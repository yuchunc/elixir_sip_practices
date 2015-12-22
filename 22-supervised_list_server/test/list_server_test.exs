defmodule ListServerTest do
  use ExUnit.Case

  #Clear the ListServer before each test
  setup do
    ListServer.start_link
    ListServer.clear
  end

  test "It Starts out empty" do
    assert ListServer.items == []
  end

  test "it lets us add things to the list" do
    ListServer.add "book"
    assert ListServer.items == ["book"]
  end

  test "it lets us remove things from the list" do
    ListServer.add "book"
    ListServer.add "toy"
    ListServer.remove "book"
    assert ListServer.items == ["toy"]
  end
end
