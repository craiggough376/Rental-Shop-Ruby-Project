require_relative('../models/game.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')

require('pry')

game1 = Game.new({"title" => "God of War", "console" => "PS4",
                  "genre" => "Action-Adventure", "rental_days" => 7})
game2 = Game.new({"title" => "Spiderman", "console" => "PS4",
                  "genre" => "Action", "rental_days" => 7})
game1.save()
game2.save()

customer1 = Customer.new({"name" => "Frank West", "email" => "frankwest@gmail.com"})
customer1.save()

rental1 = Rental.new({"customer_id" => customer1.id, "game_id" => game1.id})
rental1.save()

# game1.console = "XBOX1"
# game1.update()
# rental1.game_id = game2.id
# rental1.update()
# customer1.email = "frankwest@outlook.com"
# customer1.update

# customer1.delete()
# game1.delete()
# rental1.delete()

binding.pry
nil
