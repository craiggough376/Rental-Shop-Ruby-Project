require_relative("../db/sql_runner")

class Game

  attr_accessor :id, :title, :console, :rental_time
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @console = options['console']
    @rental_days = options['rental_days'].to_i
  end

  def save()
    sql = "INSERT INTO games (title, console, rental_days) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @console, @rental_days]
    game = SqlRunner.run(sql, values)[0]
    @id = game['id'].to_i
  end

end
