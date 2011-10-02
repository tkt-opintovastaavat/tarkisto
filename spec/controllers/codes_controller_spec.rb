require 'spec_helper'

describe CodesController do

  before(:each) do
    @code_mock = mock_model CodeSnippet
    @data = "public static void main(String[] args)"
  end

  describe "#create" do

    it "should be redirected back to new page if missing attributes." do
      CodeSnippet.should_receive(:create!).with(:text => @data).and_return(@code_mock)
      @code_mock.should_receive(:id)

      post :create, :code => @data
    end

  end

  describe "#show" do

    it "should be redirected back to new page if missing attributes." do
      @id = '1'
      CodeSnippet.should_receive(:find_by_id).with(@id).and_return(@code_mock)
      @code_mock.should_receive(:text)

      get :show, :id => @id
    end

  end

end
