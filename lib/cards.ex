defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    "hello world"
  end

  @doc """
  Creates a standard deck of playing cards.

  Returns a list of tuples representing each card in the deck.
  Each tuple contains the card value and suit.

  ## Examples

    iex> Cards.create_deck()
    [{"2", "hearts"}, {"3", "hearts"}, {"4", "hearts"}, ...]
  """
  def create_deck() do
    suits = ["hearts", "diamonds", "clubs", "spades"]
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    for suit <- suits, value <- values, do: {value, suit}
  end

  @doc """
  Shuffles the given deck of cards.

  ## Examples

      iex> deck = [1, 2, 3, 4, 5]
      iex> Cards.shuffle(deck)
      [3, 2, 5, 1, 4]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks if a given card is present in the deck.

  ## Examples

      iex> deck = [:ace, :king, :queen, :jack]
      iex> Cards.contains?(deck, :queen)
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Deals `n` cards from the `deck`.

  ## Examples

      iex> deck = [1, 2, 3, 4, 5, 6]
      iex> Cards.deal(deck, 3)
      {[1, 2, 3], [4, 5, 6]}

  """
  def deal(deck, n) do
    Enum.split(deck, n)
  end
end
