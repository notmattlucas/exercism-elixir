defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], acc), do: acc
  defp do_encode([head | tail], rest) do
    acc = <<rest::bitstring, encode_nucleotide(head)::4>>
    do_encode(tail, acc)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<head::4, tail::bitstring>>, rest) do
    acc = rest ++ [decode_nucleotide(head)]
    do_decode(tail, acc)
  end
end
