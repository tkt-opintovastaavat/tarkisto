require 'ostruct'
LDAP_CONFIG = OpenStruct.new YAML.load_file("#{Rails.root}/config/ldap.yml")[Rails.env]
