class Food
    attr_reader :id
    attr_accessor :name, :description, :calorie_count, :gluten_free, :deliciousness_factor
    @@id = 1
    def initialize(name, description, calorie_count, gluten_free, deliciousness_factor)
        @id = @@id
        @name = name
        @description = description
        @calorie_count = calorie_count
        @gluten_free = gluten_free
        @deliciousness_factor = deliciousness_factor
        # Increment food ID for every time a food is created/entered
        @@id += 1
    end

end
