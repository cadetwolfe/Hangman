class Singleplayer
    attr_accessor :name,:guessed,:correct_blank,:counter

    def initialize(password_name)
        @name = password_name.upcase
        @guessed = []
        @correct_blank = blank()
        @wrong_guess = ()
        @counter = 0
    end

    
    def correct_letter(letter)
        name.inclue?(letter)
    end
    def make_move(letter)
        if correct_letter?(letter)
            correct_index(letter)
        else
            @counter +=1
        end
    end



    def charcount
        name.length
    end
    
    def blank()
        Array.new(charcount,"_")     
    end
    
    def correct_letter?(letter)
        name.include?(letter)
    end
    def update_guessed(letter)
        guessed.push(letter)
    
    end
    def verified_guessed(letter)
     guessed.include?(letter)
        
    end
    def correct_index(guessletter)
        password=name.split ("")      
        password.each_with_index do |letter,index_position|         
            if letter == guessletter 
                correct_blank[index_position] = guessletter

            end

        end

    end
    def available_guess(choice)
        if  guessed.count(choice) == 0 
            
            true

        else
            
            false   
            
        end

    end
    
    def loser
        counter == 7
    end 

    def winner
    
         correct_blank.count("_") == 0

            

         
    end