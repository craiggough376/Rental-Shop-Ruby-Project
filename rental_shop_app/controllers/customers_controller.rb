require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

#index
get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

#new
get '/customers/new' do
  erb(:"customers/new")
end

#create

post '/customers' do
  @customer = Customer.new(params)
  @customer.save()
  erb(:"customers/show")
end

#show
get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb(:"customers/show")
end

#edit
get "/customers/:id/edit" do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit")
end

#update
post "/customers/:id" do
  @customer = Customer.new(params)
  @customer.update()
  erb(:"customers/show")
end

#delete
post '/customers/:id/delete' do
  @customer = Customer.find(params['id'])
  @customer.delete()
  erb(:"customers/delete")
end

#show customers rentals
get '/customers/:id/rentals' do
  @customer = Customer.find(params[:id])
  @rentals = @customer.rentals
  erb(:"customers/rentals")
end

#show customers current rentals
get '/customers/:id/current_rentals' do
  @customer = Customer.find(params[:id])
  @rentals = @customer.rentals
  erb(:"customers/current_rentals")
end
