require_relative("../db/sql_runner")

class Rental

  attr_accessor :id, :customer_id, :game_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @game_id = options['game_id']
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, game_id) VALUES ($1, $2)
    RETURNING id"
    values = [@customer_id, @game_id]
    game = SqlRunner.run(sql, values)[0]
    @id = game['id'].to_i
  end

  def update()
    sql = "UPDATE rentals SET (customer_id, game_id) = ($1, $2)
    WHERE id = $3"
    values = [@customer_id, @game_id, @id]
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

  def self.all
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    result = rentals.map { |rental|Rental.new(rental)  }
    return result
  end

end
