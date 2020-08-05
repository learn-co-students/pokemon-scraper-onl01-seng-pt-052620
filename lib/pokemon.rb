class Pokemon
    attr_accessor :id, :name, :type, :db 

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end
    
    def self.save(name, type, db)
        # db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
        sql = "INSERT INTO pokemon(name, type) VALUES (?, ?)"
        db.execute(sql, name, type) 
    end 

    # def self.find(id, db)
    #     sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
    #     db.execute(sql, id).map do |row|
    #         new_pokemon =  Pokemon.new
    #         new_pokemon.id = row[0]
    #         new_pokemon.name = row[1]
    #         new_pokemon.type = row[2]
    #         new_pokemon         
    #     end.first   
    # end 

    def self.find(id, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten 
        new_pokemon = Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db) 
        new_pokemon 
    end 


end



# def self.find(id, db)
#     pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
#     binding.pry
# end 








# # Failures:

#   1) Pokemon .save saves an instance of a pokemon with the correct id
#      Failure/Error: @db.execute(sql)
     
#      NoMethodError:
#        undefined method `execute' for nil:NilClass
#      # ./lib/pokemon.rb:13:in `save'
#      # ./spec/pokemon_spec.rb:24:in `block (3 levels) in <top (required)>'

#   2) Pokemon .find finds a pokemon from the database by their id number and returns a new Pokemon object
#      Failure/Error: @db.execute(sql)
     
#      NoMethodError:
#        undefined method `execute' for nil:NilClass
#      # ./lib/pokemon.rb:13:in `save'
#      # ./spec/pokemon_spec.rb:34:in `block (3 levels) in <top (required)>'

# Finished in 0.00585 seconds (files took 0.32528 seconds to load)
# 7 examples, 2 failures

# Failed examples:

# rspec ./spec/pokemon_spec.rb:23 # Pokemon .save saves an instance of a pokemon with the correct id
# rspec ./spec/pokemon_spec.rb:32 # Pokemon .find finds a pokemon from the database by their id number and returns a new Pokemon object 

# # def save
# #     sql = "INSERT INTO songs (name, album)  VALUES (?, ?)"
# #     DB[:conn].execute(sql, self.name, self.album)
# #     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0] 
# #   end   