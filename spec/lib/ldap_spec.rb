require 'spec_helper'

describe LDAP do

     before(:each) do
          @hash = {
               'host' => 'testhost',
               'base' => 'testbase',
               'bind_dn' => 'testbinddn',
               'required' => true
          }
     end

     it "should let in if it is not required" do
          @hash['required'] = false
          LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
          LDAP.authenticate('username', 'password').should == true
     end

     it "should let in if ldap returns valid user"

     it "shouldn't let in if ldap returns invalid user"

     it "shouldn't let in if ldap doesn't work"

end
