class Hangman
	attr_accessor :name,:guessed,:correct_blank,:counter

	def initialize(password_name)
		@words = ["california","hello","yellow"].upcase
	    @guessed = []
	    @correct_word = word()
	    @wrong_guess = ()
	    @counter = 0
	    
	end

	
	def spcorrect_letter(letter)
		words.random.inclue?(letter)
	end
	def spmake_move(letter)
		if correct_letter?(letter)
			correct_index(letter)
		else
			@counter +=1
		end
	end



	def spcharcount
		words.random.length
	end
	
	def spblank()
		Array.new(charcount,"_")	 
	end
	
	def spcorrect_letter?(letter)
		words.random.include?(letter)
	end
	def spupdate_guessed(letter)
		guessed.push(letter)
	
	end
	def spverified_guessed(letter)
	 guessed.include?(letter)
		
	end
	def spcorrect_index(guessletter)
	    password=words.random.split ("")	  
		password.each_with_index do |letter,index_position|			
			if letter == guessletter 
				correct_blank[index_position] = guessletter

			end

	    end

	end
	def spavailable_guess(choice)
		if  guessed.count(choice) == 0 
			
			true

		else
			
			false	
			
		end

	end
	
	def sploser
		counter == 7
	end 

	def spwinner
	
	 	 correct_word.count("_") == 0

	 		

	 	 
	end


	

	
	
	



	


end