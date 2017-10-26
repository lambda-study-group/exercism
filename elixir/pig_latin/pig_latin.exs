defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    [h|t] = ~w(#{phrase}) 
    translate(t, [_translate(h)|[]])
  end

  #"I get sad when I look at the stars 
  #They so pretty, you can't tell 'em apart
  #You think they close but really we far
  #And really, they ain't even that much closer to God
  #It's much harder to sin naked" first world problem
  #cool, this is the end of pig-latin
  def translate([], acc) do
    acc |> Enum.reverse |> Enum.join(" ")
  end

  #sure you can call yourself again my dear
  def translate([h|t], acc) do
    translate(t,[_translate(h)|acc])
  end


  #wow it's the magic, converts and replace graphemes positions
  #and the "ay" particule alone and call itself 
  defp _translate(word) do
    cond do 
      word =~ ~r/^[aeiou]|^yt|^xr/ 
        -> word <> "ay"
      word =~ ~r/^qu/
        ->  _translate(replace_unhandledpair(word) <> "qu")
      true 
      -> word = String.graphemes(word)
        conso = List.first(word)
        _translate(consonant_replacer(word, conso))
    end
  end

  defp consonant_replacer(word, replacer) do
    word = List.insert_at(word, length(word), replacer)
    word = List.delete(word, replacer)
    word = Enum.join(word, "")
    word
  end

  defp replace_unhandledpair(word) do
    fword = String.graphemes(word) 
    fword = List.delete_at(fword, 0)
    fword = List.delete_at(fword, 0)
    word = Enum.join(fword, "")
    word
  end

  
end

