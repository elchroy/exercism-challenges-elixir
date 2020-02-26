defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    cond do
      number > 2 ->
        prep_verse(number) <> "#{number - 1} bottles of beer on the wall.\n"
      number > 1 ->
        prep_verse(number) <> "#{number - 1} bottle of beer on the wall.\n"
      number > 0 ->
        "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
      true ->
        "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  defp prep_verse(number) do
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, "
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    verseRec(Enum.to_list range)
  end

  def lyrics() do
    lyrics(99..0)
  end

  defp verseRec(list, res \\ "")
  
  defp verseRec([h | t], res) do
    res = res <> "\n" <> verse(h)
    verseRec(t, res)
  end
  
  defp verseRec([], res) do
    res |> String.trim_leading
  end
end
