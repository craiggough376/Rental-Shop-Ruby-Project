require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

get '/games' do
  @games = Game.all()
  erb(:"games/index")
end

get '/games/:id' do
  @game = Game.find(params[:id])
  erb(:"games/show")
end

get '/games/:id/edit' do
  @game = Game.find(params[:id])
  erb(:"games/edit")
end

post '/games/:id' do
  @game = Game.new(params)
  @game.update()
  erb(:"games/show")
end
