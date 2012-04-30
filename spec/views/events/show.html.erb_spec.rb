require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :title => "Title",
      :place => "Place",
      :address => "Address",
      :latitude => 1.5,
      :longitude => 1.5,
      :description => "Description",
      :url => "Url",
      :fee => "Fee",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Place/)
    rendered.should match(/Address/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Description/)
    rendered.should match(/Url/)
    rendered.should match(/Fee/)
    rendered.should match(/1/)
  end
end
