defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    cal(number, "")
  end

  def cal(number, acc) when number < 1, do: acc

  def cal(number, acc) do
    [acc, v] =
      cond do
        number >= 1000 ->
          [acc <> "M", 1000]

        number >= 900 ->
          [acc <> "CM", 900]

        number >= 500 ->
          [acc <> "D", 500]

        number >= 400 ->
          [acc <> "CD", 400]

        number >= 100 ->
          [acc <> "C", 100]

        number >= 90 ->
          [acc <> "XC", 90]

        number >= 50 ->
          [acc <> "L", 50]

        number >= 40 ->
          [acc <> "XL", 40]

        number >= 10 ->
          [acc <> "X", 10]

        number >= 9 ->
          [acc <> "IX", 9]

        number >= 5 ->
          [acc <> "V", 5]

        number >= 4 ->
          [acc <> "IV", 4]

        number >= 1 ->
          [acc <> "I", 1]
      end

    cal(number - v, acc)
  end
end
