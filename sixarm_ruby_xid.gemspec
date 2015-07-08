# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_xid"
  s.summary        = "SixArm.com » Ruby » XID excellent identifier"
  s.description    = "XID generates a new string suitable for security, authentication, tracking, etc."
  s.version        = "3.4.1"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key    =  '/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem'
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"
  s.has_rdoc       = true

  s.files = [
    ".gemtest",
    "CONTRIBUTING.md",
    "Rakefile",
    "README.md",
    "VERSION",
    "lib/sixarm_ruby_xid.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_xid_test.rb",
  ]

end
