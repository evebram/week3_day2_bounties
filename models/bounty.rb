require('pg')

class Bounties

  attr_accessor :id, :name, :bounty_value, :danger_level, :favourite_weapon

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @danger_level = options['danger_level']
    @favourite_weapon = options['favourite_weapon']
  end

  def save
    db = PG.connect({dbname: 'Bounties', host: 'localhost'})
    sql = "INSERT INTO Bounties (name, bounty_value, danger_level, favourite_weapon)
          VALUES ($1, $2, $3, $4)
          RETURNING id;"
          db.prepare('save', sql)
          values = [@name, @bounty_value, @danger_level, @favourite_weapon]
          bounties = db.exec_prepared('save', values)
          @id = bounties.first['id']
          db.close
  end

  def update
    db = PG.connect({dbname: 'Bounties', host: 'localhost'})
    sql = "UPDATE Bounties ((name, bounty_value, danger_level, favourite_weapon)
          VALUES ($1, $2, $3, $4)
          WHERE id = $5;"
          values = [@name, @bounty_value, @danger_level, @favourite_weapon, @id]
          db.prepare('update', sql)
          db.exec_prepared('update', values)
          db.close
  end

  def self.delete(id)
    db = PG.connect({dbname: 'Bounties', host: 'localhost'})
    sql = "DELETE FROM Bounties WHERE id = $1;"
    values = [id]
    db.prepare('delete', sql)
    db.exec_prepared('delete', values)
    db.close
  end


end
