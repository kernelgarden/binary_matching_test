defmodule BinaryMatchingTest.BinaryUtil do

  def make_header(size, toPackSize \\ 2) do
    bin = :binary.encode_unsigned(size, :big)
    bin_size = byte_size(bin)
    need_byte_len = toPackSize - bin_size

    case need_byte_len > 0 do
      true ->
        # prepend padding byte
        build_padding_byte(need_byte_len) <> bin
      false ->
        # fit case
        bin
    end
  end

  def make_message(data) do
    header = make_header(byte_size(data), 2)
    header <> data
  end

  defp build_padding_byte(0) do
    <<>>
  end

  defp build_padding_byte(num) do
    <<0>> <> build_padding_byte(num - 1)
  end
end
