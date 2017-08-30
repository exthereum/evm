defmodule EVM.Helpers do
  @word_size 32
  @moduledoc """
  Various helper functions with no other home.
  """

  require Logger

  @doc """
  Inverts a map so each key becomes a value,
  and vice versa.

  ## Examples

      iex> EVM.Helpers.invert(%{a: 5, b: 10})
      %{5 => :a, 10 => :b}

      iex> EVM.Helpers.invert(%{dog: "cat"})
      %{"cat" => :dog}

      iex> EVM.Helpers.invert(%{cow: :moo})
      %{moo: :cow}

      iex> EVM.Helpers.invert(%{"name" => "bob"})
      %{"bob" => "name"}

      iex> EVM.Helpers.invert(%{})
      %{}
  """
  @spec invert(map()) :: map()
  def invert(m) do
    m
      |> Enum.into([])
      |> Enum.map(fn {a, b} -> {b, a} end)
      |> Enum.into(%{})
  end

  @doc """
  Gets the byte at position `pos` in binary.

  ## Examples

      iex> EVM.Helpers.binary_get(<<1, 2, 3, 4>>, 2)
      3

      iex> EVM.Helpers.binary_get(<<1, 2, 3, 4>>, 4)
      ** (ArgumentError) argument error
  """
  @spec binary_get(binary(), integer()) :: integer()
  def binary_get(binary, pos) do
    binary |> :binary.part(pos, 1) |> :binary.first
  end

  @doc """
  Gets the word size of a value or returns 0 if the value is 0

  ## Examples

      iex> EVM.Helpers.word_size(<<7::256>>)
      1

      iex> EVM.Helpers.word_size(for val <- 1..256, into: <<>>, do: <<val>>)
      8
  """
  @spec word_size(binary()) :: integer()
  def word_size(n) do
    round(:math.ceil(byte_size(n) / @word_size))
  end

  @doc """
  Helper function to print an instruction message.
  """
  def inspect(msg, prefix) do
    Logger.debug(inspect [prefix, ":", msg])

    msg
  end
end
