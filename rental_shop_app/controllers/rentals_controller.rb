require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/rental.rb' )
also_reload( '../models/*' )

#index
get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

#new
get '/rentals/new' do
  @customers = Customer.all()
  @games = Game.all()
  erb(:"rentals/new")
end

#create
post '/rentals' do
  @rental = Rental.new(params)
  @rental.rental_status = "Renting"
  @rental.save()
  @customer = Customer.find(params['customer_id'])
  @game = Game.find(params['game_id'])
  @game.quantity -= 1
  @game.update()
  erb(:"rentals/show")
end

#show
get '/rentals/:id' do
  @rental = Rental.find(params[:id])
  @customer = Customer.find(@rental.customer_id)
  @game = Game.find(@rental.game_id)
  erb(:"rentals/show")
end

#edit
get '/rentals/:id/edit' do
  @rental = Rental.find(params[:id])
  @customers = Customer.all()
  @games = Game.all()
  erb(:"rentals/edit")
end

#update
post '/rentals/:id' do
  @rental = Rental.new(params)
  @rental.rental_status = Rental.find(params['id']).rental_status
  @rental.update
  @customer = Customer.find(@rental.customer_id)
  @game = Game.find(@rental.game_id)
  erb(:"rentals/show")
end


#delete
get '/rentals/:id/delete' do
  @rental = Rental.find(params['id'])
  @game = Game.find(@rental.game_id)
  if @rental.rental_status == "Renting"
    @game.quantity += 1
    @game.update()
  end
  @rental.delete()
  erb(:"rentals/delete")
end

#return
get '/rentals/:id/return' do
  @rental = Rental.find(params[:id])
  if @rental.rental_status == "Returned"
    return "Already Returned"
  else
  @rental.rental_status = "Returned"
  @rental.update()
  @game = Game.find(@rental.game_id)
  @game.quantity += 1
  @game.update()
  end
  erb(:"rentals/return")
end
