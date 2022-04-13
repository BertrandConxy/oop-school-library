#!/usr/bin/env ruby
require './app'

puts "Welcome to OOP school library app"

def interface_options
    "\n"
    puts " Please choose among the options below by pressing its corresponding number: 
            1. List all books
            2. List all people
            3. Create person account
            4. Create a book
            5. Create a rental
            6. List all rentals for particular person
            7. Exit"
    gets.chomp
end

def main
    app = App.new()
    case interface_options
    when "1"
        app.list_all_books
    when "2"
        app.list_all_people
    when "3"
        app.create_person
    when "4"
        app.create_book
    when "5"
        app.create_rental
    when "6"
        app.list_rentals
    when "7"
        puts "Thank you for using the app!"
        return
    else
        puts "Invalid input. Please try again"
    end
end

main()
