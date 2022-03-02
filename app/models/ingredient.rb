class Ingredients
    attr_reader :name, :description

    def initialize(attributes = {})
        @name = attributes[:name]
        @description = attributes[:description] || "no description yet"
        @useful = attributes[:useful]
    end
end