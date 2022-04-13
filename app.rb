require './student'
require './classroom'
require './book'
require './rental'
require './teacher'
require './person'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    def list_all_books
        puts "Sorry, there are no books available at the moment" if @books.empty?
        @books.each { |book| puts "Book Title: \"#{book.title}\" | Author: #{book.author}" }
    end

    def list_all_people
        puts "Sorry, there are no people available at the moment" if @people.empty?
        @people.each { |person| puts "ID: #{person.id} | Name: #{person.name} | Age: #{person.age}" }
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
            puts "Invalid input. Please try again"
            return
        end
    end

    def create_teacher(specialization, age, name)
        teacher = Teacher.new(specialization, age, name)
        @people << teacher
        puts "Teacher is created successfully"
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
        puts "Student is created successfully"
    end

    def create_book
        print "Enter the book title: "
        title = gets.chomp
        print "Enter the book author: "
        author = gets.chomp

        if title.strip != '' && author.strip != ''
            book = Book.new(title, author)
            @books << book
            puts "Book is created successfully"
        else
            puts "Please provide title and author of the book"
        end
    end

    
end