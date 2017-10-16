defmodule NucleotideCount do
    @nucleotides [?A, ?C, ?G, ?T]

    @doc """
    Counts individual nucleotides in a NucleotideCount strand.

    ## Examples

    iex> NucleotideCount.count('AATAA', ?A)
    4

    iex> NucleotideCount.count('AATAA', ?T)
    1
    """
    @spec count([char], char) :: non_neg_integer
    def count(strand, nucleotide) do
        #Enum.count(strand, fn chstrand -> chstrand == nucleotide end)
        ### code above just for fun and for the sake of learning
        Enum.count(strand, &(&1 == nucleotide))
    end

    @doc """
    Returns a summary of counts by nucleotide.

    ## Examples

    iex> NucleotideCount.histogram('AATAA')
    %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
    """
    @spec histogram([char]) :: map
    def histogram(strand) do
        Enum.map(@nucleotides, &{&1, count(strand, &1)}) |> Enum.into(%{})
    end
end
