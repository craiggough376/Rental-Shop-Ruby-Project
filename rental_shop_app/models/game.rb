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

  def update()
    sql = "UPDATE games SET (title, console, rental_days) = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @console, @rental_days, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM games"
    games = SqlRunner.run(sql)
    result = games.map { |game|Game.new(game)  }
    return result
  end

end
