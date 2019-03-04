class Owner
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets

  def initialize species
    @species = species
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish name
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat name
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog name
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    animals = @pets.reduce([]) {|pets, (species, animals)|
      pets.concat(animals)
    }
    animals.each {|animal| animal.mood = "nervous"}
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.length
  end

end
