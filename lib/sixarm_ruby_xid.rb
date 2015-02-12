# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

require 'securerandom'
require 'digest/sha2'

class XID < String

  def initialize(s=nil)
    super(s || SecureRandom.hex(16))
  end

  def digest
    Digest::SHA256.new.update(self).to_s
  end

  def self.digest(s)
    Digest::SHA256.new.update(s).to_s
  end

end
