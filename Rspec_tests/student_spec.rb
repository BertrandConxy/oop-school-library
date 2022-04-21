require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  before :each do
    @student = Student.new('s1', 15, 'Kelly')
  end

  context 'given 3 arguments' do
    it 'instantiate object' do
      expect(@student).to be_instance_of(Student)
    end

    it 'has properties' do
      expect(@student.name).to eql('Kelly')
      expect(@student.classroom).to eql('s1')
      expect(@student.age).to eql(15)
    end
  end

  context ' when add_classroom method is called' do
    it 'adds student to class' do
      @s1 = Classroom.new('s1')
      @student.classroom = @s1
      expect(@student.classroom.students.length).to eql(1)
    end
  end
end
