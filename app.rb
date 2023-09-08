require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @welcome_text = "\nPlease choose an option by typing number
    1- List all books
    2- List all people
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit
    "
  end

  def add_person(person)
    @people.push(person)
  end

  def add_book(book)
    @books.push(book)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def list_books
    if @books.empty?
      puts 'Books list is empty! '
    else
      @books.each_with_index do |book, index|
        puts "#{index})- Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'People list is empty! '
    else
      @people.each_with_index do |person, index|
        puts "#{index})- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    person = create_student(name, age) if number == 1
    person = create_teacher(name, age) if number == 2
    add_person(person)
    puts 'Person created successfully.'
  end

  def create_student(name, age)
    print 'Has parent permission?[Y/N]: '
    parent_permission = if gets.chomp.match(/(n|N)/)
                          false
                        else
                          true
                        end
    Student.new(name, age, parent_permission: parent_permission)
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(name, age, specialization)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    add_book(book)
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_books
    book_id = gets.chomp.to_i
    puts 'Select a person from the following list by number: '
    list_people
    person_id = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_id], @people[person_id])
    add_rental(rental)
    puts 'Rental created successfully.'
  end

  def pick_action(number)
    case number
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def run
    puts 'Welcome to School Library App!'
    exit = false
    until exit
      puts @welcome_text
      number = gets.to_i

      if number < 7
        pick_action(number)
      elsif number == 7
        puts 'Thanks for using our library app, see you soon bye!'
        exit = true
      else
        puts "Error friend, wrong input. Sorry I don't make the rules ¯\\(ツ)/¯"
      end
    end
  end
end
