require 'spec_helper'

describe SettingsController do

  describe "GET 'account'" do
    it "should be successful" do
      get 'account'
      response.should be_success
    end
  end

  describe "GET 'password'" do
    it "should be successful" do
      get 'password'
      response.should be_success
    end
  end

end
