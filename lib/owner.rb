require 'pry'
require_relative "cat.rb"
require_relative "dog.rb"

class Owner
  
  attr_reader :name, :species
  # attr_accessor :species

  @@all = []


  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
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
    Cat.all.select do |cat|
      cat.owner == self 
    end 
  end 

  def dogs 
    Dog.all.select do |dog|
      dog.owner == self 
    end
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    pets = Dog.all + Cat.all 
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end 
  end 

  def list_pets
    #dogs
    #cats
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)." 
  end 
  #binding.pry 

end

