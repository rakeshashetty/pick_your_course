require 'spec_helper'

describe "memberships/edit" do
  before(:each) do
    @membership = assign(:membership, stub_model(Membership,
      :user => "",
      :role => "",
      :course => ""
    ))
  end

  it "renders the edit membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do
      assert_select "input#membership_user[name=?]", "membership[user]"
      assert_select "input#membership_role[name=?]", "membership[role]"
      assert_select "input#membership_course[name=?]", "membership[course]"
    end
  end
end
