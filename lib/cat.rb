class Cat
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = 'nervous'
    @@all << self
    owner.cats << self
  end
end