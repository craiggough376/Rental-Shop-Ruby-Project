require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )


get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

get '/rentals/new' do
  erb(:"rentals/new")
end

post '/rentals' do
  @rental = Rental.new(params)
  @rental.save()
  @game = Game.find(params['game_id'])
  @game.quantity -= 1
  @game.update()
  erb(:"rentals/show")
end

get '/rentals/:id' do
  @rental = Rental.find(params[:id])
  erb(:"rentals/show")
end

get '/rentals/:id/edit' do
  @rental = Rental.find(params[:id])
  erb(:"rentals/edit")
end

post '/rentals/:id' do
  @rental = Rental.new(params)
  @rental.update()
  erb(:"rentals/show")
end
