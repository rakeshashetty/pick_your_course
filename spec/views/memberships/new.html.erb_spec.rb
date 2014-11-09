require 'spec_helper'

describe "memberships/new" do
  before(:each) do
    assign(:membership, stub_model(Membership,
      :user => "",
      :role => "",
      :course => ""
    ).as_new_record)
  end

  it "renders new membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", memberships_path, "post" do
      assert_select "input#membership_user[name=?]", "membership[user]"
      assert_select "input#membership_role[name=?]", "membership[role]"
      assert_select "input#membership_course[name=?]", "membership[course]"
    end
  end
end
