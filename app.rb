require 'sinatra'
require_relative "hangman.rb"
enable :sessions 

get '/' do
	erb :index	
end 

post '/player_names' do
	session[:player1] = params[:player1]
	session[:player2]= params[:player2]
	 

	 redirect '/password'
end	

post '/singleplayer' do
	
	gameword=File.readlines("dictionary.txt").map(&:chomp)

	session[:singlep] = params[:singlep]

	session[:game]=Hangman.new(gameword.sample)

	 redirect '/guessing'

end	


get '/password' do
	
	
	 erb :password, locals:{p1_name: session[:player1] , p2_name: session[:player2]}

end

post '/gameword' do

	password = params[:word]
	session[:game]=Hangman.new(password)
	
	 
	  redirect '/guessing' 
end

get '/guessing' do

	
	erb :guessing, locals:{p1_name: session[:player1], p2_name: session[:player2], blank: session[:game].correct_blank.join(" "), array: session[:game].guessed.join(" "), message: "Pick a Letter", message2: "", counter: session[:game].counter, singlep: session[:singlep]}

end

post '/guess' do
	
	choice = params[:guess].upcase
		
		if session[:game].winner == true
			redirect '/guessing'
		 	
		 	 # erb :guessing, locals:{p1_name: player1, p2_name: player2, blank: session[:game].correct_blank.join(" "), array: session[:game].guessed.join(" "), message: "YOU WON!", message2: "", counter: session[:game].counter}
		 

		elsif
		
		 session[:game].loser
		 
			redirect '/loser'
		
		end
		 

		if  session[:game].available_guess(choice)
			true

			session[:game].update_guessed(choice)
			session[:game].make_move(choice)
    		redirect '/guessing'
    	else
    		session[:game].correct_index(choice)
    		erb :guessing, locals:{p1_name: session[:player1], p2_name: session[:player2], blank: session[:game].correct_blank.join(" "), array: session[:game].guessed.join(" "), message: "", message2: "Already Guessed", counter: session[:game].counter, singlep: session[:singlep]}
			

    	end


end
	
	get '/winner' do

		

		erb :winner, locals:{p1_name: session[:player1], p2_name: session[:player2], password: session[:game].name}
	end
	

	get '/loser' do

		
	 	erb :loser, locals:{p1_name: session[:player1], p2_name: session[:player2], password: session[:game].name}
	
	 end


	post '/New_game' do

		redirect '/'

	end


