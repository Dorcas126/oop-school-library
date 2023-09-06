class Book
    attr_accessor :title, :author
    attr_reader  :rentals
  
    def initialize(title, author)
      @title = title
      @author = author
    end

    def add_rental(person, date)
        Rental.new(date, book, self)
    end
end