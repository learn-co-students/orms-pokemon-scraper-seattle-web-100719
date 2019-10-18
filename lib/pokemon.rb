class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(input_hash)
        @id = input_hash[:id]
        @name = input_hash[:name]
        @type = input_hash[:type]
        @db = input_hash[:db]
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon(name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon where pokemon.id = ?"
        found_pokemon = db.execute(sql, id)[0]
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2])
    end
end
