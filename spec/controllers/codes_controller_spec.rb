require 'spec_helper'

describe CodesController do

     describe "#create" do

          it "should be redirected back to new page if missing attributes." do
               @data = "public static void main(String[] args)"
               @code_mock = mock_model CodeSnippet

               CodeSnippet.should_receive(:create!).with(:text => @data).and_return(@code_mock)
               @code_mock.should_receive(:id)

               post 'create', :code => @data
          end

     end

end
