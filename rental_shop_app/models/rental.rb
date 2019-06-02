require_relative("../db/sql_runner")

class Rental

  attr_accessor :id, :customer_id, :game_id, :rental_period, :rental_status
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @game_id = options['game_id']
    @rental_period = options['rental_period'].to_i
    @rental_status = "Rented"
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, game_id, rental_period, rental_status) VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@customer_id, @game_id, @rental_period, @rental_status]
    game = SqlRunner.run(sql, values)[0]
    @id = game['id'].to_i
  end

  def update()
    sql = "UPDATE rentals SET (customer_id, game_id, rental_period, rental_status) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@customer_id, @game_id, @rental_period, @rental_status, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values)[0]
    result = Customer.new(customer)
  end

  def game()
    sql = "SELECT * FROM games WHERE id = $1"
    values = [@game_id]
    games = SqlRunner.run(sql, values)
    result = games.map { |game|Game.new(game)  }
  end

  def return_rental()
    @rental_status = false
  end

  def self.find(id)
    sql = "SELECT * FROM rentals WHERE id = $1"
    values = [id]
    rental = SqlRunner.run(sql, values)[0]
    result = Rental.new(rental)
    return result
  end

  def self.all
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    result = rentals.map { |rental|Rental.new(rental)  }
    return result
  end

end
