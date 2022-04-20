require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
    before :each do
        @class_1 = Classroom.new('s1')
    end

    context "given one argument" do
        it "instantiate object" do
            expect(@class_1).to be_instance_of(Classroom)
        end

        it "has label property" do
            expect(@class_1.label).to eql('s1')
        end

        it "adds students" do
            expect(@class_1.students.length).to eql(0)
            @student = Student.new('s1', 12, 'bertrand')
            @class_1.add_student(@student)
            expect(@class_1.students.length).to eql(1)
        end
    end
end