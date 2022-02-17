class PotionModel
    attr_reader :name, :ingredients

    def initialize(name, ingredients)
        @name = name
        @ingredients = ingredients
    end

end