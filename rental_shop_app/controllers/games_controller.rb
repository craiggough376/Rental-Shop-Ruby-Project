require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )


#index
get '/games' do
  @games = Game.all()
  erb(:"games/index")
end

#new

get '/games/new' do
  erb(:"games/new")
end

#create

post '/games' do
  @game = Game.new(params)
  @game.save()
  erb(:"games/show")
end

#show
get '/games/:id' do
  @game = Game.find(params[:id])
  erb(:"games/show")
end

#edit
get '/games/:id/edit' do
  @game = Game.find(params[:id])
  erb(:"games/edit")
end

#update
post '/games/:id' do
  @game = Game.new(params)
  @game.update()
  erb(:"games/show")
end

#delete
post '/games/:id/delete' do
  @game = Game.find(params['id'])
  @game.delete()
  erb(:"games/delete")
end

#show games rentals
get '/games/:id/rentals' do
  @game = Game.find(params['id'])
  @rentals = @game.rentals()
  erb(:"games/rentals")
end

#show games current rentals
get '/games/:id/current_rentals' do
  @game = Game.find(params[:id])
  @rentals = @game.rentals()
  erb(:"games/current_rentals")
end
