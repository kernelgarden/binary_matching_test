defmodule BinaryMatchingTest do
  @moduledoc """
  Documentation for BinaryMatchingTest.
  """

  alias BinaryMatchingTest.BinaryUtil

  def test do
    bin = BinaryUtil.make_message(<<1>>)

    IO.inspect(bin)

    bin = bin <> BinaryUtil.make_message(<<2, 3, 4>>)

    IO.inspect(bin)

    parse(bin)
  end

  defp parse(<<>>) do
    {:error, :not_enough_data}
  end

  defp parse(<<length::big-16, data::binary>>) do
    #IO.puts("length: #{length}")

    case data do
      <<data::binary - size(length), remain::binary>> ->
        #IO.inspect("data: #{data}, remain: #{remain}")
        #IO.inspect(remain)
        process(data)
        parse(remain)
      _ ->
        {:error, :not_enough_data}
    end
  end

  defp process(data) do
    IO.puts("data: #{inspect data}")
  end

  # worst case
  #defp parse(%{first: first}, <<length::size(32), data::binary>>) do
  #  IO.puts("length: #{length}")
  #end

  # bad case
  #defp parse(<<length::size(32), data::binary>>) do
  #  case byte_size(data) >= length do
  #    true ->
  #      IO.puts("length: #{length}")
  #    false ->
  #      :error
  #  end
  #end
end
