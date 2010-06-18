LDAP_CONFIG = OpenStruct.new YAML.load_file("#{RAILS_ROOT}/config/ldap.yml")[RAILS_ENV]
