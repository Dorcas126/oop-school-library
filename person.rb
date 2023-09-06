class Person
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    rental = Rental.new(date, self, book)
    @rentals << rental
    rental
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
