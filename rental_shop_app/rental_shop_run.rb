require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/customers_controller')
require_relative('./controllers/games_controller')
require_relative('./controllers/rentals_controller')
require_relative( './models/customer.rb' )
require_relative( './models/game.rb' )
require_relative( './models/rental.rb' )
also_reload( '../models/*' )


get '/' do
  @rentals = Rental.all
  @games = Game.all
  erb( :index )
end
