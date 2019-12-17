require "pry"
class Owner
  attr_reader :name, :species, :dog, :cat 
  @@all = []
  @@cats = []
  @@dogs = []
  def initialize(name)
    @name = name
    @species = "human"
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
    @@all = []
  end
  def cats
    Cat.all.select {|ele| ele.owner == self}
  end
  def dogs
    Dog.all.select {|ele| ele.owner == self}
  end
  def buy_cat(cat)
    obj = Cat.new(cat,self)
    @@cats << obj
  end
  def buy_dog(dog)
    # binding.pry
    obj = Dog.new(dog,self)
    @@dogs << obj
  end
  def walk_dogs
    # binding.pry
    # @@dogs.each {|ele| ele.mood = "happy" }
    self.dogs.each {|ele| ele.mood = "happy"}
    
  end
  def feed_cats
    self.cats.each {|ele| ele.mood = "happy"}
    
  end
  def sell_pets
    @@cats.map do |ele| 
      ele.owner = nil
       ele.mood = "nervous"
    end
    self.dogs.each {|ele| ele.mood = "nervous"}
    self.cats.each {|ele| ele.mood = "nervous"}
    self.cats.each {|ele| ele.owner = nil}
    self.dogs.each {|ele| ele.owner = nil}
    
    @@cats = []
    @@dogs.map {|ele| ele.owner = nil}
    @@dogs = []
  end
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end