require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :title => "Title",
        :place => "Place",
        :address => "Address",
        :latitude => 1.5,
        :longitude => 1.5,
        :description => "Description",
        :url => "Url",
        :fee => "Fee",
        :user_id => 1
      ),
      stub_model(Event,
        :title => "Title",
        :place => "Place",
        :address => "Address",
        :latitude => 1.5,
        :longitude => 1.5,
        :description => "Description",
        :url => "Url",
        :fee => "Fee",
        :user_id => 1
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Fee".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
