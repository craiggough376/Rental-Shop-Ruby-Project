require_relative('../models/game.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')

require('pry')

game1 = Game.new({"title" => "God of War", "console" => "PS4", "genre" => "Action-Adventure", "quantity" => 10})
game2 = Game.new({"title" => "Spiderman", "console" => "PS4", "genre" => "Action-Adventure", "quantity" => 10})
game3 = Game.new({"title" => "Red Dead Redemption", "console" => "XBOX1", "genre" => "RPG", "quantity" => 10})
game4 = Game.new({"title" => "Call Of Duty Black Ops 4", "console" => "PS4", "genre" => "FPS", "quantity" => 10})
game5 = Game.new({"title" => "Uncharted 4", "console" => "PS4", "genre" => "Action-Adventure", "quantity" => 10})
game6 = Game.new({"title" => "Forza 4", "console" => "XBOX1", "genre" => "Racing", "quantity" => 10})
game7 = Game.new({"title" => "The Witcher III", "console" => "XBOX1", "genre" => "FPS", "quantity" => 10})
game8 = Game.new({"title" => "The Last Of Us", "console" => "XBOX1", "genre" => "Horror", "quantity" => 10})
game9 = Game.new({"title" => "Fifa 19", "console" => "PS4", "genre" => "Sports", "quantity" => 10})
game10 = Game.new({"title" => "GTA V", "console" => "PS4", "genre" => "RPG", "quantity" => 10})
game1.save()
game2.save()
game3.save()
game4.save()
game5.save()
game6.save()
game7.save()
game8.save()
game9.save()
game10.save()


customer1 = Customer.new({"name" => "Ryan West", "email" => "frankwest@gmail.com"})
customer2 = Customer.new({"name" => "Simon Jones", "email" => "simonjones21@gmail.com"})
customer3 = Customer.new({"name" => "Brian Thompsom", "email" => "brian_thompson@outlook.com"})
customer4 = Customer.new({"name" => "Sarah Jenkins", "email" => "sarahnorth@gmail.com"})
customer1.save()
customer2.save()
customer3.save()
customer4.save()


rental1 = Rental.new({"customer_id" => customer1.id, "game_id" => game1.id, "rental_period" => 7, "rental_status" => "Renting"})
rental2 = Rental.new({"customer_id" => customer1.id, "game_id" => game2.id, "rental_period" => 2, "rental_status" => "Returned"})
rental3 = Rental.new({"customer_id" => customer1.id, "game_id" => game3.id, "rental_period" => 2, "rental_status" => "Renting"})
rental4 = Rental.new({"customer_id" => customer2.id, "game_id" => game4.id, "rental_period" => 4, "rental_status" => "Renting"})
rental5 = Rental.new({"customer_id" => customer2.id, "game_id" => game2.id, "rental_period" => 2, "rental_status" => "Renting"})
rental6 = Rental.new({"customer_id" => customer3.id, "game_id" => game5.id, "rental_period" => 7, "rental_status" => "Renting"})
rental7 = Rental.new({"customer_id" => customer3.id, "game_id" => game6.id, "rental_period" => 7, "rental_status" => "Returned"})
rental8 = Rental.new({"customer_id" => customer3.id, "game_id" => game10.id, "rental_period" => 1, "rental_status" => "Returned"})
rental9 = Rental.new({"customer_id" => customer4.id, "game_id" => game7.id, "rental_period" => 2, "rental_status" => "Renting"})
rental10 = Rental.new({"customer_id" => customer4.id, "game_id" => game8.id, "rental_period" => 2, "rental_status" => "Returned"})
rental1.save()
rental2.save()
rental3.save()
rental4.save()
rental5.save()
rental6.save()
rental7.save()
rental8.save()
rental9.save()
rental10.save()


# game1.console = "XBOX1"
# game1.update()
# rental1.game_id = game2.id
# rental1.update()
# customer1.email = "frankwest@outlook.com"
# customer1.update

# game1.quantity -= 1
# game1.update()

# customer1.delete()
# game1.delete()
# rental1.delete()

# rental1.return_rental()
# 
# binding.pry
# nil
