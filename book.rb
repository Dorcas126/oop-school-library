require 'securerandom'

class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  def initialize(title, author)
    @id = SecureRandom.random_number(1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental
  end
end
