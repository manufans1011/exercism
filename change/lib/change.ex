defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) do
    reversed = Enum.reverse(coins)
    helper(reversed, target, [])
  end

  def generate(_, 0), do: {:ok, []}

  defp helper(_, 0, acc), do: {:ok, acc}
  defp helper([], _, _acc), do: {:error, "cannot change"}
  defp helper([head | tail], target, acc) do
    cond do
      target >= head -> helper([head | tail], target - head, [head] ++ acc)
      true -> helper(tail, target, acc)
    end
  end
end
