require 'spec_helper'

describe "courses/edit" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "MyString",
      :parent_id => 1,
      :type => ""
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", course_path(@course), "post" do
      assert_select "input#course_name[name=?]", "course[name]"
      assert_select "input#course_parent_id[name=?]", "course[parent_id]"
      assert_select "input#course_type[name=?]", "course[type]"
    end
  end
end
