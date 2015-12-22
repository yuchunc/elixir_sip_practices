defmodule PipeOperatorPlaygroundTest do
  use ExUnit.Case

  test "ps_ax outputs some process" do
    output = """
    16370 s003  S+     0:00.06 ruby /Users/Mickey/.rbenv/versions/2.2.3/bin/guard
    16390 s003  S+     0:34.36 ruby /Users/Mickey/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/guard-2.13.0/bin/_guard-core
    16396 s003  S+     0:00.10 /Users/Mickey/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/rb-fsevent-0.9.6/bin/fsevent_watch --latency 0.1 /Users/Mickey/Optimis/wellness-demo
    95441 s004  Us+    0:00.02 login -pflq Mickey /Users/Mickey/.nvm/versions/node/v5.1.0/bin/ungit
    95442 s004  S+     0:00.96 node /Users/Mickey/.nvm/versions/node/v5.1.0/bin/ungit
    95448 s004  S+     0:14.95 /Users/Mickey/.nvm/versions/node/v5.1.0/bin/node /Users/Mickey/.nvm/versions/node/v5.1.0/lib/node_modules/ungit/source/server.js
    """

    assert Unix.ps_ax == output
  end

  test "grep(line, thing) returns lines that match 'thing'" do
  end

  test "awk(input, 1) splits on whitespac and return the first column" do
  end

  test "the whole pipeline works" do
  end
end
