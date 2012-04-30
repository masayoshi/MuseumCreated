require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :title => "MyString",
      :place => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :description => "MyString",
      :url => "MyString",
      :fee => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "input#event_place", :name => "event[place]"
      assert_select "input#event_address", :name => "event[address]"
      assert_select "input#event_latitude", :name => "event[latitude]"
      assert_select "input#event_longitude", :name => "event[longitude]"
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_url", :name => "event[url]"
      assert_select "input#event_fee", :name => "event[fee]"
      assert_select "input#event_user_id", :name => "event[user_id]"
    end
  end
end
