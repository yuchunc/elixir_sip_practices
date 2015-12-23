defmodule PongTest do
  use ExUnit.Case

  test "it represent to a ping with pong" do
    pong = spawn_link(Pong, :start, [])
    Process.send pong, {:ping, self}, []
    assert_receive {:pong, ^pong}
  end

  test "it responds to two pings with two pongs" do
    pong = spawn_link(Pong, :start, [])
    Process.send pong, {:ping, self}, []
    assert_receive {:pong, ^pong}
    Process.send pong, {:ping, self}, []
    assert_receive {:pong, ^pong}
  end
end
