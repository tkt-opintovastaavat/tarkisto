require 'spec_helper'

describe SchoolDates do

     describe "#semester" do
          before(:each) do
               @fakedate = "lol"
               Date.should_receive(:today).and_return(@fakedate)
          end
                                             
          it "should return spring" do
               @fakedate.should_receive(:month).and_return(1)
               SchoolDates.semester.should == 'K'
          end
                                
          it "should return summer" do
               @fakedate.should_receive(:month).and_return(6)
               SchoolDates.semester.should == 'V'
          end
          
          it "should return autumn" do
               @fakedate.should_receive(:month).and_return(11)
               SchoolDates.semester.should == 'S'
          end
     
     end

end
