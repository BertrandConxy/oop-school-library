require_relative './student'
require_relative './teacher'
require 'json'

class PeopleModule
  attr_accessor :people

  def initialize
    @storage_file = './storage/people.json'
    file = JSON.parse(File.read(@storage_file))
    @people = file.empty? ? [] : file
  end

  def list_all_people
    puts 'Sorry, there are no people available at the moment' if @people.empty?
    puts "There are #{@people.count} people in the system"
    @people.each_with_index do |person, index|
      puts "#{index + 1})[#{person['json_class']}] Name: #{person['name']} | Age: #{person['age']} | ID: #{person['id']}"
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
    teacher = teacher.to_json
    @people << teacher
    File.write(@storage_file, JSON[@people])
    puts ''
    puts "Teacher is created successfully. Your ID is #{teacher['id']}"
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
    student = student.to_json
    @people << student
    File.write(@storage_file, JSON[@people])
    puts ''
    puts "Student is created successfully. Your ID is #{student['id']}"
  end
end
