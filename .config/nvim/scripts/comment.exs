IO.read(:stdio, :eof)
|> String.split("\n", trim: true)
|> Enum.map(&("# " <> &1))
|> Enum.join("\n")
|> IO.puts
