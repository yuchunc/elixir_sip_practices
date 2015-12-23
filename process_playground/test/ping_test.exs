defmodule PingTest do
  use ExUnit.Case

  test "it represent to a pong with ping" do
    ping = spawn_link(Ping, :start, [])
    Process.send ping, {:pong, self}, []
    assert_receive {:ping, ^ping}
  end

  test "it responds to two pongs with two pings" do
    ping = spawn_link(Ping, :start, [])
    Process.send ping, {:pong, self}, []
    assert_receive {:ping, ^ping}
    Process.send ping, {:pong, self}, []
    assert_receive {:ping, ^ping}
  end
end
