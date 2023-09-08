
require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)

class Person
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @age = age

    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []

  end

  def add_rental(date, book)
    rental = Rental.new(date, self, book)
    @rentals << rental
    rental
  end

  def correct_name
    @name
  end

  def can_use_services?
    nil unless of_age || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
