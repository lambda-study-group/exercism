defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"}

  defp translate_codon(codon) do
    cond do 
    @codons[codon] != nil 
    -> {:ok , @codons[codon]}
    true -> {:error, "invalid codon"}
    end
  end
    
  
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    _of_rna(rna, "")
  end

  def _of_rna("", acc) do
    {:ok, ~w(#{acc})}
  end

  def _of_rna(strand, acc) do
    {codon, strand} = strand |> String.split_at(3)
    {slice, msg} = translate_codon(codon)
    cond do
      msg == "invalid codon" -> {slice, "invalid RNA"}
      msg == "STOP" -> {slice, ~w(#{acc})}
      true -> _of_rna(strand, acc <> " " <> msg)
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """

  


  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    translate_codon(codon)
  end
end

