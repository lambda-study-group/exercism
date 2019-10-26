defmodule Grep do
  @spec grep(String.t(), [String.t()], [String.t()]) :: String.t()
  def grep(pattern, flags, files) do
    Enum.map(files, fn file ->
      File.stream!(file)
      |> Stream.with_index()
      |> Stream.filter(fn {line, _} ->
        if Enum.member?(flags, "-v"),
          do: !matches(line, pattern, Enum.member?(flags, "-i"), Enum.member?(flags, "-x")),
          else: matches(line, pattern, Enum.member?(flags, "-i"), Enum.member?(flags, "-x"))
      end)
      |> Enum.map(fn
        {line, i} ->
          format_output(
            file,
            line,
            i,
            Enum.count(files),
            Enum.member?(flags, "-l"),
            Enum.member?(flags, "-n")
          )
      end)
      |> Enum.uniq()
      |> to_string
    end)
    |> to_string
  end

  @spec matches(binary, binary | [binary] | :binary.cp(), any, any) :: boolean
  def matches(line, pattern, case_insensitive, complete_match) do
    case {String.trim_trailing(line), pattern} do
      {line, pattern} when case_insensitive and complete_match ->
        String.downcase(line) == String.downcase(pattern)

      {line, pattern} when case_insensitive ->
        String.contains?(String.downcase(line), String.downcase(pattern))

      {line, pattern} when complete_match ->
        line == pattern

      {line, pattern} ->
        String.contains?(line, pattern)
    end
  end

  def format_output(filename, line, index, nr_files, only_file_name, print_line_numbers) do
    case {filename, line, index} do
      {filename, _, _} when only_file_name ->
        "#{filename}\n"

      {filename, line, index} when print_line_numbers and nr_files > 1 ->
        "#{filename}:#{index + 1}:#{line}"

      {_, line, index} when print_line_numbers ->
        "#{index + 1}:#{line}"

      {filename, line, _} when nr_files > 1 ->
        "#{filename}:#{line}"

      {_, line, _} ->
        "#{line}"
    end
  end
end
