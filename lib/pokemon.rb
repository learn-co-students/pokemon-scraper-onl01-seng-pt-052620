#require_relative "../bin/environment.rb"
#require_relative "../bin/run.rb"
#require_relative "../bin/sql_runner.rb"


class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize (attributes = {})

        attributes.each do |attribute_key, attribute_value|
            self.send("#{attribute_key}=", attribute_value) if self.respond_to?("#{attribute_key}=")
        end

    end

    def self.save(name, type, db)

        sql = <<-SQL
                INSERT INTO ?
                VALUES (?, ?)
                SQL

        DB[:conn].execute(sql, self.db, self.name, self.type)

    end
end
