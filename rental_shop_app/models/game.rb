require_relative("../db/sql_runner")

class Game

  attr_accessor :id, :title, :console, :quantity, :rental_status
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @console = options['console']
    @quantity = options['quantity'].to_i
    @rental_status = options['rental_status']
  end

  def save()
    sql = "INSERT INTO games (title, console, quantity,rental_status) VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@title, @console, @quantity, @rental_status]
    game = SqlRunner.run(sql, values)[0]
    @id = game['id'].to_i
  end

  def update()
    sql = "UPDATE games SET (title, console, quantity, rental_status) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@title, @console, @quantity, @rental_status, @id]
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT customers.* FROM customers
    INNER JOIN rentals
    ON rentals.customer_id = customers.id
    WHERE game_id = $1"
    values = [@id]
    customer = SqlRunner.run(sql, values)[0]
    result = Customer.new(customer)
    return result
  end

  def delete()
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def reduce_quantity(id)
  #   sql = "UPDATE games SET (quantity) = ($1) WHERE id = $2"
  #   values = [id]
  #   SqlRunner.run(sql, values)
  # end

  def self.find(id)
    sql = "SELECT * FROM games WHERE id = $1"
    values = [id]
    game = SqlRunner.run(sql, values)[0]
    result = Game.new(game)
    return result
  end

  def self.all
    sql = "SELECT * FROM games"
    games = SqlRunner.run(sql)
    result = games.map { |game|Game.new(game)  }
    return result
  end

end
