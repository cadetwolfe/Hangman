require "Minitest/autorun"
require_relative "hangman.rb"

class Testhangmanfunctions < Minitest::Test

	def test_class_returns_upcased_word
		hangman = Hangman.new("WoLfE")
		assert_equal("WOLFE",hangman.name)
	end

	def test_class_returns_password
		hangman = Hangman.new("wolfe")
		assert_equal(5,hangman.charcount)
	end

 
	def test_class_returns_five_blanks
		hangman = Hangman.new("wolfe")
		assert_equal(["_","_","_","_","_"],hangman.blank) 
	end

	def test_class_returns_if_included_in_password
		hangman = Hangman.new("wolfe")
		letter = "O"
		assert_equal(true,hangman.correct_letter?(letter))
	end

	  def test_class_user_guess_is_pushed_into_guessing_array
		hangman = Hangman.new("wolfe")
		hangman.guessed = ["S","T","B"]
		letter = "Y"
		assert_equal(["S","T","B","Y"],hangman.update_guessed(letter))
	  end
	  def test_return_correct_index_positions
	  	hangman = Hangman.new("wolfe")
	  	letter="W"
	  	hangman.correct_index(letter)
	  	assert_equal(["W","_","_","_","_"],hangman.correct_blank)
	  end
	  def test_return_correct_position
	  	hangman = Hangman.new("wolfe")
	  	hangman.correct_blank = ["W","_","_","_","_"]
	  	letter="F"
	  	hangman.correct_index(letter)
	  	assert_equal(["W","_","_","F","_"],hangman.correct_blank)
	  end
	  def test_correct_blank_array_stays_same_for_invalid_guess
		hangman = Hangman.new("wolfe")
		letter = "P"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","_","_"],hangman.correct_blank)
	  end
  	   def test_correct_blank_array_stays_same_for_invalid_guess1
		hangman = Hangman.new("wolfe")
		letter = "W"
		hangman.correct_index(letter)
		assert_equal(["W","_","_","_","_"],hangman.correct_blank)
	end
	def test_class_if_guess_already_in_array_ornot_returns_false
		hangman = Hangman.new("wolfe")
		hangman.guessed = ["p","c","u"]
		letter = "p"
		assert_equal(false,hangman.available_guess(letter))
	end
	def test_class_see_if_guess_has_been_guessed
		hangman = Hangman.new("wolfe")
		hangman.guessed = ["s","w","p"]
		letter = "o"
		assert_equal(true,hangman.available_guess(letter))
	end

	def test_winner
		hangman = Hangman.new("wolfe")
		hangman.correct_blank = ["w","o","l","f","e"]
		assert_equal(true,hangman.winner)
	end

	






end






















