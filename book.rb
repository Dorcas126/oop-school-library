class Book

  attr_accessor :title, :author, :id
  attr_reader :rentals

  def initialize(title, author)
    @id = Random.rand(1..1000)

  attr_accessor :title, :author, :rentals

  def initialize(title, author)

    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)

    Rental.new(date, self, person)

    rental = Rental.new(date, self, person)
    @rentals << rental
    rental

  end
end
