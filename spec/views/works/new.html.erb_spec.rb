require 'spec_helper'

describe "works/new.html.erb" do
  before(:each) do
    assign(:work, stub_model(Work,
      :title => "MyString",
      :url => "MyString",
      :summary => "MyString",
      :description => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new work form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => works_path, :method => "post" do
      assert_select "input#work_title", :name => "work[title]"
      assert_select "input#work_url", :name => "work[url]"
      assert_select "input#work_summary", :name => "work[summary]"
      assert_select "textarea#work_description", :name => "work[description]"
      assert_select "input#work_user_id", :name => "work[user_id]"
    end
  end
end
