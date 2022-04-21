require_relative '../classes/teacher'

describe Teacher do
    before :each do
        @teacher = Teacher.new('physics', 34, 'Mark peters')
    end
    context 'given arguments' do
        it "instantiate an object " do
            expect(@teacher).to be_instance_of(Teacher)
        end
    end
    context 'when can_use_service? method is called' do
        it "return true or false" do
            expect(@teacher.can_use_services?).not_to be false
        end
    end
    context 'to json' do
        it "" do
            @json = @teacher.to_json(@teacher)
            expect(@json).to eql ({"age"=>34, "id"=>@teacher.id, "json_class"=>"Teacher", "name"=>"Mark peters", "parent_permission"=>true, "specialization"=>"physics"})
        end
    end
end