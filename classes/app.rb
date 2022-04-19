require_relative './student'
require_relative './bookmodule'
require_relative './classroom'
require_relative './rental'
require_relative './teacher'
require_relative './person'
require_relative './decorator'

class App
  def initialize
    @books = BookModule.new
    @people = []
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
      list_all_people
    when '3'
      create_person
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

  def list_all_people
    puts 'Sorry, there are no people available at the moment' if @people.empty?
    puts "There are #{@people.count} people in the system"
    @people.each_with_index do |person, index|
      puts "#{index + 1})[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}"
    end
  end

  def create_person
    print 'To create teacher account, press 1. To create student account, press 2:  '
    option = gets.chomp
    print 'Enter your name: '
    name = gets.chomp
    print 'Enter your age: '
    age = gets.chomp.to_i

    case option
    when '1'
      print 'Enter your specialization: '
      spec = gets.chomp
      create_teacher(spec, age, name)
    when '2'
      print 'Enter your class: '
      class_grade = gets.chomp
      create_student(class_grade, age, name)
    else
      puts ''
      puts 'Invalid input. Please try again'
      nil
    end
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts ''
    puts "Teacher is created successfully. Your ID is #{teacher.id}"
  end

  def create_student(class_grade, age, name)
    print 'Do you have parent permission? [Y/N]'
    choice = gets.chomp.downcase
    case choice
    when 'y'
      student = Student.new(class_grade, age, name, parent_permission: true)
    when 'n'
      student = Student.new(class_grade, age, name, parent_permission: false)
    else
      puts 'invalid selection. Please try again'
      return
    end
    @people << student
    puts ''
    puts "Student is created successfully. Your ID is #{student.id}"
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
