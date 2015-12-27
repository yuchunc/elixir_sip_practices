defmodule HttpcTest do
  use ExUnit.Case
  doctest HttpClientSurvey

  test "parsing the content of a page" do
    { :ok, {{ _verssion, 200, _reason}, _headers, body}} = :httpc.request('http://example.com')
    # NOTE body comes in as char list with single quotes, so it need to be converted to string
    assert Regex.match?(~r/illustrative examples/, to_string(body) )
  end
end
