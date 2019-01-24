require "pry"

class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @pets = { :fishes => [], :dogs => [], :cats => [] }
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

  def self.count
    @@count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(pet_name)
    fish = Fish.new(pet_name)
    @pets[:fishes] << fish
  end

  def buy_cat(pet_name)
    cat = Cat.new(pet_name)
    @pets[:cats] << cat
  end

  def buy_dog(pet_name)
    dog = Dog.new(pet_name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |species, pet| 
      pet.each do |k| 
        k.mood = "nervous"
      end
    end
    @pets = {}
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end