require 'spec_helper'

describe LDAP do

  before(:each) do
    @username = 'username'
    @password = 'password'
    @ldap_mock = mock Net::LDAP
  end

  describe "#authenticate" do

    before(:each) do
      @hash = {
        'host' => 'testhost',
        'base' => 'testbase',
        'required' => true
      }
    end

    it "should let in if it is not required" do
      @hash['required'] = false
      LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
      LDAP.authenticate(@username, @password).should == true
    end

    it "should let in if ldap returns valid user" do
      LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:authenticate).with("uid=#{@username},#{@hash['base']}", @password).and_return(true)
      @ldap_mock.should_receive(:bind).and_return(true)
      LDAP.authenticate(@username, @password).should == true
    end

    it "shouldn't let in if ldap returns invalid user" do
      LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:authenticate).with("uid=#{@username},#{@hash['base']}", @password).and_return(true)
      @ldap_mock.should_receive(:bind).and_return(false)
      LDAP.authenticate(@username, @password).should == false
    end

    it "shouldn't let in if ldap doesn't work" do
      LDAP_CONFIG.should_receive(:authentication).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:authenticate).with("uid=#{@username},#{@hash['base']}", @password)
      @ldap_mock.should_receive(:bind).and_raise(Errno::ETIMEDOUT)
      LDAP.authenticate(@username, @password).should == false
    end

  end

  describe "#departmentcheck" do

    before(:each) do
      @hash = {
        'required' => true
      }
    end

    it "should let in if not required" do
      @hash['required'] = false
      LDAP_CONFIG.should_receive(:department).and_return(@hash)
      LDAP.departmentcheck(@username).should == true
    end

    it "shouldn't let in if ldap doesn't work" do
      LDAP_CONFIG.should_receive(:department).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:host=).with(@hash['host'])
      @ldap_mock.should_receive(:base=).with(@hash['base'])
      @ldap_mock.should_receive(:search).with(:filter => "uid=#{@username}").and_raise(Net::LDAP::LdapError)
      LDAP.departmentcheck(@username).should == false
    end

    it "should let in if required and found exactly one" do
      LDAP_CONFIG.should_receive(:department).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:host=).with(@hash['host'])
      @ldap_mock.should_receive(:base=).with(@hash['base'])
      @ldap_mock.should_receive(:search).with(:filter => "uid=#{@username}").and_return([true])
      LDAP.departmentcheck(@username).should == true
    end

    it "shouldn't let in if required and found more then one" do
      LDAP_CONFIG.should_receive(:department).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:host=).with(@hash['host'])
      @ldap_mock.should_receive(:base=).with(@hash['base'])
      @ldap_mock.should_receive(:search).with(:filter => "uid=#{@username}").and_return([true, false])
      LDAP.departmentcheck(@username).should == false
    end

    it "shouldn't let in if required and not found" do
      LDAP_CONFIG.should_receive(:department).and_return(@hash)
      Net::LDAP.should_receive(:new).and_return(@ldap_mock)
      @ldap_mock.should_receive(:host=).with(@hash['host'])
      @ldap_mock.should_receive(:base=).with(@hash['base'])
      @ldap_mock.should_receive(:search).with(:filter => "uid=#{@username}").and_return([])
      LDAP.departmentcheck(@username).should == false
    end

  end

end
