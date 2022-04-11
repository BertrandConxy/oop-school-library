require "./person"

class Student < Person
    attr_accessor :classroom
    def initialize (classroom, name= 'unknown', age, parent_permission: true)
        super(name, age, parent_permission: parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end
