require 'pry'
class Owner
  # code goes here

  attr_accessor 
  attr_reader :species, :name

  @@all =[]

  def initialize(name, species= "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
     "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, owner = self)
  
    cat
  end

  def buy_dog(name)
    dog = Dog.new(name, owner = self)
  
    dog
  end

  def walk_dogs
    #binding.pry
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.clear
    cats.clear
    cats.each {|cat| cat.mood = "nervous"}
    dogs.each {|dog| dog.mood = "nervous"}
    dogs.each {|dog| dog.owner = nil}
    cats.each {|cat| cat.owner = nil}
    #binding.pry
  end

  def list_pets
   "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  
end