require_relative('../models/game.rb')
require('pry')

game1 = Game.new({"title" => "God of War", "console" => "PS4", "rental_days" => "7"})
game1.save()

customer1 = Customer.new({"name" => "Frank West", "email" => "frankwest@gmail.com"})
customer1.save()
