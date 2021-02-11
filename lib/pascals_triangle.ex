defmodule PascalsTriangle do
  import Enum

  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num), do: make_rows([[1]], num - 1)

  defp make_rows(previous_rows, row_num)
  defp make_rows(previous_rows, 0), do: reverse(previous_rows)
  defp make_rows(rows = [previous | _], n) do
    summed =
      previous
      |> chunk_every(2, 1, :discard)
      |> map(&sum/1)
    make_rows([[1] ++ summed ++ [1] | rows], n - 1)
  end
end
