require 'spec_helper'

describe User do
  
  it "has a valid factory" do 
  	create(:user).should be_valid 
  end

  it { should validate_presence_of(:first_name) }  
  
  it { should validate_presence_of(:last_name) }

  ###### Association #########

  describe "memberships by role type" do 
    before :each do 
      @user = create(:user)
      @role = Role.find_by_name "Student"
      @professor_role = Role.find_by_name "Professor"
      @student1 = create(:membership, :user => @user, :role_id => @role.id) 
      @professor = create(:membership, :user => @user, :role_id => @professor_role.id)
      @student2 =  create(:membership, :user => @user, :role_id => @role.id) 
    end 
    
    context "student memberships" do 
      it "returns all student memberships for a user" do 
       @user.students.should == [@student1, @student2] 
      end
    end 
    context "professor memberships" do 
      it "returns all professor memberships for a user" do
        @user.professors.should == [@professor]
      end 
    end 

    it { should have_many(:memberships) }

  end 

  it "should return full name for #name" do
  	user = build(:user, first_name: "Rakesh", last_name: "Space") 
  	user.name.should == "Space, Rakesh" 
  end

  it "should return name with email for #inline_info" do
  	subject.inline_info.should == "#{subject.first_name} #{subject.last_name} : #{subject.email}" 
  end
  
  describe "#admin?" do
    before { @user = build(:admin_user) }

    it "should return true for admin@example.com" do
      @user.admin?.should == true  
    end

    it "should return false for any other email" do
      subject.admin?.should == false  
    end

  end
 

end
