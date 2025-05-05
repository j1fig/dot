# Turns
#      div.some-class
# into
#      <div class="some-class">
#      </div>
# Test with
# $ elixir -r heex.exs heex_test.exs

defmodule HtmlExpander do
  @allowed_tags ["div", "a", "p", "span", "section", "h1", "h2", "header"]

  def expand(line) do
    line = line
      |> String.split("\n", trim: true)
      |> List.first
    leading_whitespace = line
      |> String.split(" ")
      |> Enum.find_index(fn w -> String.starts_with?(w, @allowed_tags) end)
    
    case leading_whitespace do
      nil -> line <> "\n"    # NOOP if tag match not found.
      whitespaces ->
        [tag, class] = String.split(line, " ", trim: true)
          |> List.first
          |> String.split(".", trim: true)
        lead = String.duplicate(" ", whitespaces)
        "#{lead}<#{tag} class=\"#{class}\">\n#{lead}</#{tag}>"
    end
  end
end

IO.read(:stdio, :eof)
  |> HtmlExpander.expand
  |> IO.puts
