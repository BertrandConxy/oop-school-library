require_relative './bookmodule'
require_relative './personmodule'
require_relative './rentalsmodule'

class App
  def initialize
    @books = BookModule.new
    @people = PeopleModule.new
    @rentals = RentalsModule.new(@books.books, @people.people)
  end

  def interface_options
    puts ''
    puts " Please choose among the options below by pressing its corresponding number:
            1. List all books
            2. List all people
            3. Create person account
            4. Create a book
            5. Create a rental
            6. List all rentals for particular person
            7. Exit"
  end

  def option
    interface_options
    selection = gets.chomp
    case selection
    when '1'
      @books.list_all_books
    when '2'
      @people.list_all_people
    when '3'
      @people.create_person
    when '4'
      @books.create_book
    when '5'
      @rentals.create_rental
    when '6'
      @rentals.list_all_rentals
    when '7'
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Invalid input. Please try again'
    end
    option
  end
end
