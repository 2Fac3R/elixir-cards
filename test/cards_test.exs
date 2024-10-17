defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  describe "hello/0" do
    test "returns 'hello world'" do
      assert Cards.hello() == "hello world"
    end
  end

  describe "create_deck/0" do
    test "returns a deck of 52 unique cards" do
      deck = Cards.create_deck()
      assert length(deck) == 52
      assert Enum.uniq(deck) |> length() == 52
    end
  end

  describe "shuffle/1" do
    test "shuffles the deck" do
      deck = [1, 2, 3, 4, 5]
      shuffled_deck = Cards.shuffle(deck)
      assert length(shuffled_deck) == length(deck)
      assert Enum.all?(deck, fn x -> Enum.member?(shuffled_deck, x) end)
    end
  end

  describe "contains?/2" do
    test "checks if a card is present in the deck" do
      deck = [:ace, :king, :queen, :jack]
      assert Cards.contains?(deck, :queen)
    end
  end

  describe "deal/2" do
    test "deals n cards from the deck" do
      deck = [1, 2, 3, 4, 5, 6]
      {hand, remaining} = Cards.deal(deck, 3)
      assert hand == [1, 2, 3]
      assert remaining == [4, 5, 6]
    end
  end

  describe "save/2" do
    test "saves the deck to a file" do
      deck = Cards.create_deck()
      filename = "test_deck.txt"

      # Ensure the file does not exist before the test
      if File.exists?(filename) do
        File.rm!(filename)
      end

      assert Cards.save(deck, filename) == :ok
      assert File.exists?(filename)

      # Clean up the file after the test
      File.rm!(filename)
    end

    test "returns :error if there is an error saving the deck" do
      deck = Cards.create_deck()
      filename = "/invalid_path/test_deck.txt"

      assert Cards.save(deck, filename) == :error
    end
  end
end
