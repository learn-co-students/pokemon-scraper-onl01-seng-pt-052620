require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        new_poke = Pokemon.new(name:name, type:type, db:db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, new_poke.name, new_poke.type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = (?)"
        array = db.execute(sql, id)[0]
        Pokemon.new(id:array[0],name:array[1],type:array[2],db:db)
    end



end
