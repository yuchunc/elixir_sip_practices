require Record
Record.is_record {MarkdownServer.RenderedDocument, body: nil, title: "Untitled Document" }

defmodule MarkdownServer.Renderer do

  def render_string(string) do
    body = string |> Markdown.to_html
    MarkdownServer.RenderedDocument.new
  end
end

defmodule MarkdownServer.RendererTest do
  use ExUnit.Case

  test "renders markdown documents from strings" do
    rendered_document = MarkdownServer.Renderer.render_string("This doc has no title")
    expected_body = "<p>This doc has no title</p>\n"
    expected_title = "Untitled Document"
    assert MarkdownServer.RenderedDocument[title: expected_title, body: expected_body] == rendered_document
  end
end
