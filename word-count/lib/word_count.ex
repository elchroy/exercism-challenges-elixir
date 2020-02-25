defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[^\p{L}\d-]+/u, " ")
    |> String.split()
    |> store(%{})
  end

  def store([h | t], map) do
    store(t, Map.put(map, h, Map.get(map, h, 0) + 1))
  end

  def store([], map) do
    map
  end
end
