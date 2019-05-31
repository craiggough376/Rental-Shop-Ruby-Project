require_relative("../db/sql_runner")

class Customer

  attr_accessor :id, :name, :email
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO customers (name, email) VALUES ($1, $2)
    RETURNING id"
    values = [@name, @email]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, email) = ($1, $2)
    WHERE id = $3"
    values = [@name, @email, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer|Customer.new(customer)  }
    return result
  end


end
