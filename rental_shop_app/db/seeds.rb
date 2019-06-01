require_relative('../models/game.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')

require('pry')

game1 = Game.new({"title" => "God of War", "console" => "PS4",
                  "genre" => "Action-Adventure", "quantity" => 7})
game2 = Game.new({"title" => "Spiderman", "console" => "PS4",
                  "genre" => "Action", "quantity" => 7})
game1.save()
game2.save()


customer1 = Customer.new({"name" => "Frank West", "email" => "frankwest@gmail.com"})
customer2 = Customer.new({"name" => "Simon Jones", "email" => "simonjones21@gmail.com"})
customer3 = Customer.new({"name" => "Brian Thompsom", "email" => "brian_thompson@outlook.com"})
customer4 = Customer.new({"name" => "Sarah North", "email" => "sarahnorth@gmail.com"})
customer5 = Customer.new({"name" => "Jamie Jenkins", "email" => "jjenkins@hotmail.com"})
customer6 = Customer.new({"name" => "Harry Richmond", "email" => "harryrichmond@gmail.com"})
customer7 = Customer.new({"name" => "Katie King", "email" => "katieking89@gmail.com"})
customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()
customer7.save()

rental1 = Rental.new({"customer_id" => customer1.id, "game_id" => game1.id, "rental_period" => 7})
rental2 = Rental.new({"customer_id" => customer1.id, "game_id" => game2.id, "rental_period" => 2})
rental1.save()
rental2.save()


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

binding.pry
nil
