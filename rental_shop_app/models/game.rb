require_relative("../db/sql_runner")

class Game

  attr_accessor :id, :title, :console, :quantity, :image
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @console = options['console']
    @quantity = options['quantity'].to_i
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO games (title, console, quantity, image) VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@title, @console, @quantity, @image]
    game = SqlRunner.run(sql, values)[0]
    @id = game['id'].to_i
  end

  def update()
    sql = "UPDATE games SET (title, console, quantity, image) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@title, @console, @quantity, @image, @id]
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

  def rentals()
    sql = "SELECT * FROM rentals WHERE game_id = $1"
    values = [@id]
    rentals = SqlRunner.run(sql, values)
    result = rentals.map { |rental|Rental.new(rental)  }
    return result
  end

  def reduce_quantity()
    @quantity -= 1
  end

  def increase_quantity()
    @quantity += 1
  end

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
