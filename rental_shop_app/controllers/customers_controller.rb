require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb(:"customers/show")
end
