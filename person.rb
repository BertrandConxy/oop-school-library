require './decorator'

class Person < Nameable
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end
end
