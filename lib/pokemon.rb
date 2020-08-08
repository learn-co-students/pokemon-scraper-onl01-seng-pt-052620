class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:,name:,type:,db:,hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  def self.save(name, type, db_connection)
    sql = "INSERT INTO pokemon (name, type)
           VALUES (?,?)"
   db_connection.execute(sql, name,type)

  end

  def self.find(id, db_connection)

    sql = "SELECT * FROM pokemon WHERE id =?"
    pokemon =db_connection.execute(sql,id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]
    Pokemon.new(id:id, name:name,type:type, hp:hp, db:db_connection)

  end
end
