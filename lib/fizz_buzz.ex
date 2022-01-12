defmodule FizzBuzz do

  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """
  Hello world.

  ## Examples

  """
  def fizz_buzz(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluete_numbers/1)

      {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluete_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluete_numbers()
  end

  defp evaluete_numbers(number) when(rem(number, 3) == 0 and rem(number, 5) == 0), do: :fizzbuzz
  defp evaluete_numbers(number) when(rem(number, 3) == 0), do: :fizz
  defp evaluete_numbers(number) when(rem(number, 5) == 0), do: :buzz
  defp evaluete_numbers(number), do: number

end
