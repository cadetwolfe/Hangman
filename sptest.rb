require "Minitest/autorun"
require_relative "sp.rb"

class Testhangmanfunctions < Minitest::Test

	def test_class_returns_upcased_word
		sp = Sp.new("WoLfE")
		assert_equal("WOLFE",sp.name)
	end

	def test_class_returns_password
		sp = Sp.new("wolfe")
		assert_equal(5,sp.charcount)
	end

 
	def test_class_returns_five_blanks
		sp = Sp.new("wolfe")
		assert_equal(["_","_","_","_","_"],sp.blank) 
	end

	def test_class_returns_if_included_in_password
		sp = Sp.new("wolfe")
		letter = "O"
		assert_equal(true,sp.correct_letter?(letter))
	end

	  def test_class_user_guess_is_pushed_into_guessing_array
		sp = Sp.new("wolfe")
		sp.guessed = ["S","T","B"]
		letter = "Y"
		assert_equal(["S","T","B","Y"],sp.update_guessed(letter))
	  end
	  def test_return_correct_index_positions
	  	sp = Sp.new("wolfe")
	  	letter="W"
	  	sp.correct_index(letter)
	  	assert_equal(["W","_","_","_","_"],sp.correct_blank)
	  end
	  def test_return_correct_position
	  	sp = Sp.new("wolfe")
	  	sp.correct_blank = ["W","_","_","_","_"]
	  	letter="F"
	  	sp.correct_index(letter)
	  	assert_equal(["W","_","_","F","_"],sp.correct_blank)
	  end
	  def test_correct_blank_array_stays_same_for_invalid_guess
		sp = Sp.new("wolfe")
		letter = "P"
		sp.correct_index(letter)
		assert_equal(["_","_","_","_","_"],sp.correct_blank)
	  end
  	   def test_correct_blank_array_stays_same_for_invalid_guess1
		sp = Sp.new("wolfe")
		letter = "W"
		sp.correct_index(letter)
		assert_equal(["W","_","_","_","_"],sp.correct_blank)
	end
	def test_class_if_guess_already_in_array_ornot_returns_false
		sp = Sp.new("wolfe")
		sp.guessed = ["p","c","u"]
		letter = "p"
		assert_equal(false,sp.available_guess(letter))
	end
	def test_class_see_if_guess_has_been_guessed
		sp = Sp.new("wolfe")
		sp.guessed = ["s","w","p"]
		letter = "o"
		assert_equal(true,sp.available_guess(letter))
	end

	def test_winner
		sp = Sp.new("wolfe")
		sp.correct_blank = ["w","o","l","f","e"]
		assert_equal(true,sp.winner)
	end

	






end






















