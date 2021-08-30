defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    raindrop = modulo_3(number) <> modulo_5(number) <> modulo_7(number)
    case raindrop do
      "" -> to_string(number)
      _ -> raindrop
    end
  end

  defp modulo_3(number) do
    cond do
      rem(number,3) == 0 -> "Pling"
      true -> ""
    end
  end

  defp modulo_5(number) do
    cond do
      rem(number,5) == 0 -> "Plang"
      true -> ""
    end
  end

  defp modulo_7(number) do
    cond do
      rem(number,7) == 0 -> "Plong"
      true -> ""
    end
  end

end
