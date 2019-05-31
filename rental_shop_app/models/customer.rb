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

end
