require 'spec_helper'

describe ImagesController do

     describe "#create" do

          it "should create image from parameters" do
               @data = {}
               @image_mock = mock_model Image
               
               Image.should_receive(:create).with(@data).and_return(@image_mock)

               post 'create', :image => @data

               assigns(:image).should == @image_mock
          end

     end

end
