require './student'
require './classroom'
require './book'
require './rental'
require './teacher'
require './person'
require './decorator'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    def start_console
        option()
    end

    def list_all_books
        puts "Sorry, there are no books available at the moment" if @books.empty?
        puts "There are #{@books.count} book(s) in the system"
        @books.each_with_index { |book, index| puts "#{index + 1}) Book Title: \"#{book.title}\" | Author: #{book.author}" }
    end

    def list_all_people
        puts "Sorry, there are no people available at the moment" if @people.empty?
        puts "There are #{@people.count} people in the system"
        @people.each_with_index { |person, index| puts "#{index + 1})[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
    end

    def create_person
        print "To create teacher account, press 1. To create student account, press 2..."
        option = gets.chomp
        print "Enter your name: "
        name = gets.chomp
        print "Enter your age: "
        age = gets.chomp.to_i

        case option
        when "1"
            print "Enter your specialization: "
            spec = gets.chomp
            create_teacher(spec, age, name)
        when "2"
            print "Enter your class: "
            class_grade = gets.chomp
            create_student(class_grade, age, name)
        else
            puts ""
            puts "Invalid input. Please try again"
            return
        end
    end

    def create_teacher(specialization, age, name)
        teacher = Teacher.new(specialization, age, name)
        @people << teacher
        puts ""
        puts "Teacher is created successfully. Your ID is #{teacher.id}"
    end

    def create_student(class_grade, age, name)
        print "Do you have parent permission? [Y/N]"
        choice = gets.chomp.downcase
        case choice
        when "y"
            student = Student.new(class_grade, age, name, parent_permission: true)
        when "n"
            student = Student.new(class_grade, age, name, parent_permission: false)
        else
            puts "invalid selection. Please try again"
            return
        end
        @people << student
        puts ""
        puts "Student is created successfully. Your ID is #{student.id}"
    end

    def create_book
        print "Enter the book title: "
        title = gets.chomp
        print "Enter the book author: "
        author = gets.chomp

        if title.strip != '' && author.strip != ''
            book = Book.new(title, author)
            @books << book
            puts ""
            puts "Book is created successfully"
        else
            puts ""
            puts "Please provide title and author of the book"
        end
    end

    def create_rental
        puts "Please press the number corresponding to the book that you want: "
        @books.each_with_index { |book, index| puts "#{index + 1}) Book Title: \"#{book.title}\" | Author: #{book.author}" }
        number = gets.chomp.to_i
        index = number - 1

        puts "PLease type your ID (See from the list of people below): "
        @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
        identity = gets.chomp.to_i

        individual = @people.select { |person| person.id == identity }.first

        print "Enter the date[yyyy-mm-dd]: "
        date = gets.chomp.to_s

        rent = Rental.new(date, @books[index], individual)
        @rentals << rent
        
        puts "The book has been rented successfully"
    end

    def list_all_rentals
        puts "No rentals has been made at the moment" if @rentals.empty?
        print "To view your rental records, type your ID: "
        id = gets.chomp.to_i
        rental = @rentals.select { |rental| rental.person.id == id }
        if rental.empty?
            puts "No records for that particular ID"
        else 
            puts "Your rental records are the following: "
            puts ""
            rental.each { |record| puts "Date: #{record.date} | Borrowed book: \"#{record.book.title}\" by #{record.book.author}" }
        end
    end
        
end
