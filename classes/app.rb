require_relative './bookmodule'
require_relative './personmodule'
require_relative './rental'

class App
  def initialize
    @books = BookModule.new
    @people = PeopleModule.new
    @rentals = []
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
      create_rental
    when '6'
      list_all_rentals
    when '7'
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Invalid input. Please try again'
    end
    option
  end

  def create_rental
    if @books.empty? && @people.empty?
      puts 'There are no books and people in the system'
    else
      puts 'Please press the number corresponding to the book that you want: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Book Title: \"#{book.title}\" | Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'PLease type your ID (See from the list of people below): '
      @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter the date[yyyy-mm-dd]: '
      date = gets.chomp.to_s

      rent = Rental.new(date, @books[index], individual)
      @rentals << rent

      puts 'The book has been rented successfully'
    end
  end

  def list_all_rentals
    puts 'No rentals has been made at the moment' if @rentals.empty?
    print 'To view your rental records, type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rend| rend.person.id == id }
    if rental.empty?
      puts 'No records for that particular ID'
    else
      puts 'Your rental records are the following: '
      puts ''
      rental.each_with_index do |record, index|
        puts "#{index + 1}| Date: #{record.date} | Borrower: #{record.person.name}
         | Status: #{record.person.class} | Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
      end
    end
  end
end
