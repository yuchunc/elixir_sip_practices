defmodule Schizo do
  @moduledoc """
    Hello Moduel
  """

  @doc """
    uppercase everyother word in sentence. Example:

    iex> Schizo.uppercase("silly rabbit, bang bang")
    "silly RABbIT, bang BANG"
  """
  def uppercase string do
    #string |> String.split |> transform_upcase
    transform_every_other_word(string, &uppercaser/1)
  end

  @doc """
    unvowels every other word in sentence. Example:

    iex> Schizo.unvowel("silly rabbit, bang bang")
    "silly rbbt, bang bng"
  """
  def unvowel string do
    transform_every_other_word(string, &vowel_remover/1)
  end

  def transform_every_other_word(string, transformation) do
    words = String.split(string)

    words_with_index = Stream.with_index(words)

    transformed_words = Enum.map(words_with_index, transformation)

    Enum.join(transformed_words, " ")
  end

  def uppercaser(input) do
    transformer(input, &String.upcase/1 )
  end

  def vowel_remover(input) do
    transformer(input, fn(word) -> Regex.replace( ~r([aeiou]), word, "" ) end)
  end

  def transformer({word, index}, transformation) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformation.(word)
    end
  end

  #def transform_upcase(words), do: _transform_upcase(words, [])

  #def _transform_upcase([], processed), do: Enum.join(processed, " ")

  #def _transform_upcase([head | tail], processed), do: _transform_upcase( tail, List.flatten(processed, [head]), true)

  #def _transform_upcase([], processed, _), do: Enum.join(processed, " ")

  #def _transform_upcase([head | tail], processed, _), do: _transform_upcase( tail, List.flatten(processed, [String.upcase(head)] ))
end
