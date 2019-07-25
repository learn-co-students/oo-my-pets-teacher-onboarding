require "pry"

class Owner
  # code goes here
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    @dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    @cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    @dogs.each do |dog|
      dog.mood = 'nervous'
      dog.owner = nil
    end
    @cats.each do |cat|
      cat.mood = 'nervous'
      cat.owner = nil
    end
    @dogs.clear
    @cats.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end