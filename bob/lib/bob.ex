defmodule Bob do
  def hey(input) do
    cond do
      question(input) ->
        "Sure."
      shout(input) ->
        "Woah, chill out!"
      nothing(input) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end

  defp question(input), do: String.last(input) == "?"
  defp shout(input), do: String.upcase(input) == input
  defp nothing(input), do: String.strip(input) == ""
end
