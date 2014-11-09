require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "Name",
      :parent_id => 1,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Type/)
  end
end
