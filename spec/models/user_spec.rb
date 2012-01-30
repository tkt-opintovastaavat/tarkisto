require 'spec_helper'

describe User do

  before(:each) do
    @valid_attributes = {
      :username => 'ptkarjal',
      :email => 'ptkarjal@cs.helsinki.fi',
      :language => 'fi'
    }
  end


  describe "creation" do
    it "should create a new instance given valid attributes" do
      User.create!(@valid_attributes)
    end
  end

end
