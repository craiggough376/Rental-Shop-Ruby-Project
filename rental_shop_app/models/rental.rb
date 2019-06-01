require_relative("../db/sql_runner")

class Rental

  attr_accessor :id, :customer_id, :game_id, :rental_period
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @game_id = options['game_id']
    @rental_period = options['rental_period'].to_i
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, game_id, rental_period) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@customer_id, @game_id, @rental_period]
    game = SqlRunner.run(sql, values)[0]
    @id = game['id'].to_i
  end

  def update()
    sql = "UPDATE rentals SET (customer_id, game_id, rental_period) = ($1, $2, $3)
    WHERE id = $4"
    values = [@customer_id, @game_id, @rental_period, @id]
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
