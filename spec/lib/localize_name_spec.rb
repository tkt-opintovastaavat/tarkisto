require 'spec_helper'

describe LocalizeName do

  it "should call localized name" do
    class ExampleClass
      include LocalizeName
    end

    @example_class = ExampleClass.new
    @name = "localized name"
    @example_class.should_receive(:send).and_return(@name)
    @example_class.name.should == @name
  end

end
