require_relative './rental'
require 'json'
class RentalsModule
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    @storage_file = './storage/rentals.json'
    file = JSON.parse(File.read(@storage_file))
    @rentals = file.empty? ? [] : file
    @books = books
    @people = person
  end

  def list_all_rentals
    puts 'No rentals has been made at the moment' if @rentals.empty?
    print 'To view your rental records, type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rend| rend['person']['id']== id }
    if rental.empty?
      puts 'No records for that particular ID'
    else
      puts 'Your rental records are the following: '
      puts ''
      rental.each_with_index do |record, index|
        puts ''
        print "#{index + 1}| Date: #{record['date']} | Borrower: #{record['person']['name']}"
        print " | Status: #{record['person']['class'} | Borrowed book: \"#{record['book']['title']}\" by #{record['book']['author']}"
        puts ''
      end
    end
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
end
