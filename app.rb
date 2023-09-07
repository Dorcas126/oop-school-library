require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @welcome_text = "\nYou can select an option by typing the corresponding number
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
      puts 'The list of books is currently devoid of any entries'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1})- Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'People list is empty!'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1})- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def list_rentals
    print 'Person identification number: '
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
    print 'Would you like to generate a student (1) or a teacher (2)? [Please input the corresponding number]: '
    number = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    person = create_student(name, age) if number == 1
    person = create_teacher(name, age) if number == 2
    add_person(person)
    puts 'Person has been successfully created.'
  end

  def create_student(name, age)
    print 'Is there parental authorization? [Y/N]: '
    parent_permission = !gets.chomp.match?(/^[nN]/)
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
    puts 'Book successfully created.'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_books
    book_id = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number: '
    list_people
    person_id = gets.chomp.to_i - 1
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_id], @people[person_id])
    add_rental(rental)
    puts 'Rental successfully created.'
  end

  def pick_action(number)
    actions = {
      1 => method(:list_books),
      2 => method(:list_people),
      3 => method(:create_person),
      4 => method(:create_book),
      5 => method(:create_rental),
      6 => method(:list_rentals),
      7 => method(:exit_program)
    }

    action = actions[number]

    if action
      action.call
    else
      handle_invalid_input
    end
  end

  def run
    puts 'Welcome to School Library'
    exit = false
    until exit
      puts @welcome_text
      number = gets.to_i

      if number >= 1 && number <= 7
        pick_action(number)
        exit = true if number == 7
      else
        puts 'Oops, wrong input. I am not the one who establishes the rules, I am here to assist ¯\\(ツ)/¯'
      end
    end
  end
end

# Example usage:
# app = App.new
# app.run
