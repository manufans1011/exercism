defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.


  @sum 0
  @spec length(list) :: non_neg_integer
  def length(l), do: length(l, 0)
  defp length([], n), do: n
  defp length([_|tail], n), do: length(tail, n+1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], rev), do: rev
  defp reverse([head|tail], rev), do: reverse(tail, [head|rev])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, [])
  defp map([], _, out), do: reverse(out)
  defp map([head|tail], f, out), do: map(tail, f, [f.(head) | out])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])
  defp filter([], _, out), do: reverse(out)
  defp filter([h|_] = l, f, out), do: filter(l, f, out, f.(h))
  defp filter([h|t], f, out, true), do: filter(t, f, [h|out])
  defp filter([_|t], f, out, false), do: filter(t, f, out)

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f) do
  end

  # @type acc :: any
  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f) do
  end

  @spec append(list, list) :: list
  def append(a, []), do: a
  def append([], b), do: b
  def append(a, b), do: append(a, b, [])
  defp append([], [], out), do: reverse(out)
  defp append([], [head|tail], out), do: append([], tail, [head | out])
  defp append([head|tail], b, out), do: append(tail, b, [head | out])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: concat(ll, [])
  defp concat([], out), do: reverse(out)
  defp concat([head|tail], out), do: concat(tail, head, out)
  defp concat(ll, [], out), do: concat(ll, out)
  defp concat(ll, [head|tail], out), do: concat(ll, tail, [head|out])
end
