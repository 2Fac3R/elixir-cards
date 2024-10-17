defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      "hello world"

  """
  def hello do
    "hello world"
  end

  @doc """
  Creates a standard deck of playing cards.

  Returns a list of tuples representing each card in the deck.
  Each tuple contains the card value and suit.

  ## Examples

      iex> length(Cards.create_deck()) == 52
      true

      iex> Enum.uniq(Cards.create_deck()) |> length == 52  # Verifica que no haya duplicados
      true
  """
  def create_deck do
    suits = ["hearts", "diamonds", "clubs", "spades"]
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    for suit <- suits, value <- values, do: {value, suit}
  end

  @doc """
  Shuffles the given deck of cards.

  ## Examples

      iex> deck = [1, 2, 3, 4, 5]
      iex> shuffled_deck = Cards.shuffle(deck)
      iex> length(shuffled_deck) == length(deck)
      true
      iex> Enum.all?(deck, fn x -> Enum.member?(shuffled_deck, x) end)
      true

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

  @doc """
  Converts a tuple into a string.

  ## Parameters

    - `tuple`: A tuple containing two elements, `key` and `value`.

  ## Returns

    - A string representation of the tuple in the format "key value".

  ## Examples

      iex> Cards.tuple_to_string({:name, "Alice"})
      "name Alice"

      iex> Cards.tuple_to_string({:age, 30})
      "age 30"
  """
  def tuple_to_string({key, value}) do
    "#{key} #{value}"
  end

  @doc """
  Saves the deck to a file.

  ## Parameters

    - `deck`: A list of tuples representing the deck of cards.
    - `filename`: The name of the file to save the deck to.

  ## Returns

      - `:ok` if the deck was saved successfully.
      - `:error` if there was an error saving the deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.save(deck, "deck.txt")
      :ok
  """
  def save(deck, filename \\ "deck.txt") do
    content = deck |> Enum.map(&tuple_to_string/1) |> Enum.join("\n")

    case File.write(filename, content) do
      :ok -> :ok
      {:error, _reason} -> :error
    end
  end
end
