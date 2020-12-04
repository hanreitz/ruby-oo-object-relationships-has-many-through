class Waiter

    attr_accessor :name, :yrs_experience
  
    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end
    
    def customers
        meals.map {|meal| meal.customer}
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end 

    # def most_frequent_customer
    #     customers.max_by {|customer| customers.count(customer)}
    # end

    # def worst_tipped_meal
    #     worst_tipped = meals.min {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
    #     worst_tipped
    # end

    # def self.most_experienced_waiter
    #     waiter_experience = {}
    #     Meal.all.each {|meal| waiter_experience[meal.waiter] += 1}
    #     waiter_experience.max_by {|waiter, meals| meals}[0]
    # end

    # def self.least_experienced_waiter
    #     waiter_experience = {}
    #     Meal.all.each {|meal| waiter_experience[meal.waiter] += 1}
    #     waiter_experience.min_by {|waiter, meals| meals}[0]
    # end

    # def average_tips
    #     tips = meals.collect {|meal| meal.tip}
    #     average_tips = tips.reduce(+:)/tips.size.to_f
    #     average_tips
    # end

    # puts Waiter.most_experienced_waiter.average_tips
        
end