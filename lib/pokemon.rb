class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(name:, type:, db:, id:)
    @name = name 
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    prepared = db.prepare(" INSERT INTO pokemon (name, type)
        VALUES (?, ?)")
      
    prepared.execute(name, type)
  end
  
  def self.find(id, db)
    prepared = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    outcome = prepared.execute(id)
    
    result = outcome.map do |row|
      pokemon = Pokemon.new(name: row[1], type: row[2], db: db,  id: id)
      pokemon
    end
    result[0]
  end
end
