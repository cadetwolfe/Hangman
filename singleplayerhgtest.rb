require "Minitest/autorun"
require_relative "singleplayerhg.rb"

class Testhangmanfunctions < Minitest::Test

	def test_class_returns_upcased_word
		singleplayer = Singleplayer.new("WoLfE")
		assert_equal("WOLFE",singleplayer.name)
	end

	def test_class_returns_password
		singleplayer = Singleplayer.new("wolfe")
		assert_equal(5,singleplayer.charcount)
	end

 
	def test_class_returns_five_blanks
		singleplayer = Singleplayer.new("wolfe")
		assert_equal(["_","_","_","_","_"],singleplayer.blank) 
	end

	def test_class_returns_if_included_in_password
		singleplayer = Singleplayer.new("wolfe")
		letter = "O"
		assert_equal(true,singleplayer.correct_letter?(letter))
	end

	  def test_class_user_guess_is_pushed_into_guessing_array
		singleplayer = Singleplayer.new("wolfe")
		singleplayer.guessed = ["S","T","B"]
		letter = "Y"
		assert_equal(["S","T","B","Y"],singleplayer.update_guessed(letter))
	  end
	  def test_return_correct_index_positions
	  	singleplayer = Singleplayer.new("wolfe")
	  	letter="W"
	  	singleplayer.correct_index(letter)
	  	assert_equal(["W","_","_","_","_"],singleplayer.correct_blank)
	  end
	  def test_return_correct_position
	  	singleplayer = Singleplayer.new("wolfe")
	  	singleplayer.correct_blank = ["W","_","_","_","_"]
	  	letter="F"
	  	singleplayer.correct_index(letter)
	  	assert_equal(["W","_","_","F","_"],singleplayer.correct_blank)
	  end
	  def test_correct_blank_array_stays_same_for_invalid_guess
		singleplayer = Singleplayer.new("wolfe")
		letter = "P"
		singleplayer.correct_index(letter)
		assert_equal(["_","_","_","_","_"],singleplayer.correct_blank)
	  end
  	   def test_correct_blank_array_stays_same_for_invalid_guess1
		singleplayer = Singleplayer.new("wolfe")
		letter = "W"
		singleplayer.correct_index(letter)
		assert_equal(["W","_","_","_","_"],singleplayer.correct_blank)
	end
	def test_class_if_guess_already_in_array_ornot_returns_false
		singleplayer = Singleplayer.new("wolfe")
		singleplayer.guessed = ["p","c","u"]
		letter = "p"
		assert_equal(false,singleplayer.available_guess(letter))
	end
	def test_class_see_if_guess_has_been_guessed
		singleplayer = Singleplayer.new("wolfe")
		singleplayer.guessed = ["s","w","p"]
		letter = "o"
		assert_equal(true,singleplayer.available_guess(letter))
	end

	def test_winner
		singleplayer = Singleplayer.new("wolfe")
		singleplayer.correct_blank = ["w","o","l","f","e"]
		assert_equal(true,singleplayer.winner)
	end

	






end






















