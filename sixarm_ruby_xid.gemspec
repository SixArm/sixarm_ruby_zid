# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_xid"
  s.summary        = "SixArm.com » Ruby » XID excellent identifier"
  s.description    = "XID generates a new string suitable for security, authentication, tracking, etc."
  s.version        = "3.2.0"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key    = '/opt/keys/sixarm/sixarm-rsa2048-x509-20140312-gem-private-key.pem'
  s.cert_chain     = ['/opt/keys/sixarm/sixarm-rsa2048-x509-20140312-gem-public-cert.pem']

  s.platform       = Gem::Platform::RUBY
  s.require_path   = 'lib'
  s.has_rdoc       = true

  top_files        = [".gemtest", "CONTRIBUTING.md", "Rakefile", "README.md", "VERSION"]
  lib_files        = ["lib/#{s.name}.rb"]
  test_files       = ["test/#{s.name}_test.rb"]

  s.files          = top_files + lib_files + test_files
  s.test_files     = test_files

end
