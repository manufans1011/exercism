defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @code_mapper %{
    0b1 => "wink",
    0b10 => "double blink",
    0b100 => "close your eyes",
    0b1000 => "jump"
  }

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code_mappers = Map.keys(@code_mapper) |> Enum.sort()
    sec_handshake(code, code_mappers [])
  end

  defp sec_handshake(code, [], handshake) when (0b10000 &&& code)
  defp sec_handshake(_code, [], handshake) do: Enum.reverse(handshake)
end
