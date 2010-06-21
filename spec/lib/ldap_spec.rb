require 'spec_helper'

describe LDAP do

     before(:each) do
          @username = 'username'
          @password = 'password'
     end

     describe "#authenticate" do

          before(:each) do
               @hash = {
                    'host' => 'testhost',
                    'base' => 'testbase',
                    'bind_dn' => 'testbinddn',
                    'required' => true
               }
               @ldap_mock = mock_model Net::LDAP
          end

          it "should let in if it is not required" do
               @hash['required'] = false
               LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
               LDAP.authenticate(@username, @password).should == true
          end

          it "should let in if ldap returns valid user" do
               LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
               Net::LDAP.should_receive(:new).and_return(@ldap_mock)
               @ldap_mock.should_receive(:host=).with(@hash['host'])
               @ldap_mock.should_receive(:base=).with(@hash['base'])
               @ldap_mock.should_receive(:bind_as).with(:method => :simple_tls, :base => "uid=#{@username},#{@hash['bind_dn']}", :password => @password).and_return(true)
               LDAP.authenticate(@username, @password).should == true
          end

          it "shouldn't let in if ldap returns invalid user" do
               LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
               Net::LDAP.should_receive(:new).and_return(@ldap_mock)
               @ldap_mock.should_receive(:host=).with(@hash['host'])
               @ldap_mock.should_receive(:base=).with(@hash['base'])
               @ldap_mock.should_receive(:bind_as).with(:method => :simple_tls, :base => "uid=#{@username},#{@hash['bind_dn']}", :password => @password).and_return(false)
               LDAP.authenticate(@username, @password).should == false
          end

          it "shouldn't let in if ldap doesn't work" do
               LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
               Net::LDAP.should_receive(:new).and_return(@ldap_mock)
               @ldap_mock.should_receive(:host=).with(@hash['host'])
               @ldap_mock.should_receive(:base=).with(@hash['base'])
               @ldap_mock.should_receive(:bind_as).with(:method => :simple_tls, :base => "uid=#{@username},#{@hash['bind_dn']}", :password => @password).and_raise(Net::LDAP::LdapError)
               LDAP.authenticate(@username, @password).should == false
          end

     end

     describe "#departmentcheck" do

          before(:each) do
               @hash = {
                    'required' => true
               }
               @ldap_mock = mock_model Net::LDAP
          end

          it "should let in if not required" do
               @hash['required'] = false
               LDAP_CONFIG.should_receive(:department).and_return(@hash)
               LDAP.departmentcheck(@username).should == true
          end

          it "should let in if required and found"

          it "shouldn't let in if required and not found"

     end

end
