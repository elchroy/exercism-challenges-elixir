defmodule Bob do
  def hey(input) do
    cond do
      input |> is_not_empty? and input |> is_upcase? and input |> is_question? -> "Calm down, I know what I'm doing!"
      input |> is_not_empty? and input |> is_upcase? -> "Whoa, chill out!"
      input |> is_not_empty? and input |> is_question? -> "Sure."
      input |> is_empty? or input |> is_nothing_actually? -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp is_question?(str) do
    str |> String.trim |> String.ends_with?("?")
  end

  defp is_upcase?(str) do
    str |> contains_letter? and str =~ ~r{^[^a-z]*$}
  end

  defp is_nothing_actually?(str) do
    !contains_letter?(str) and !contains_num?(str) 
  end

  defp contains_letter?(str) do
    str =~ ~r/\p{L}/ # any letter of any language
  end

  defp contains_num?(str) do
    str =~ ~r/[0-9]/
  end

  defp is_empty?(str) do
    String.trim(str) === ""
  end

  defp is_not_empty?(str) do
    ! is_empty?(str)
  end
end
