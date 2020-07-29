class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @name = name
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
       sql = <<-SQL 
       INSERT INTO pokemon (name, type)
       VALUES (?, ?)
       SQL
   
       db.execute(sql, name, type)
       @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 

    def self.find(id, db)
        sql = <<-SQL 
        SELECT * FROM pokemon WHERE id = ?
        LIMIT 1
        SQL

        result = db.execute(sql, id)[0]

        self.new_from_db(result, db)
    end 

    def self.new_from_db(array, db)
        new_poke = Pokemon.new(name: array[1], type: array[2], db: db)
        new_poke.id = array[0]
        new_poke
    end 

end
