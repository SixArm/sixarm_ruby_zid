# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

require 'securerandom'
require 'digest/sha2'

class XID < String

  def initialize(s = nil)
    s and (XID.valid?(s) or raise ArgumentError)
    super(s || SecureRandom.hex)
  end

  def valid?
    XID.valid?(self)
  end

  def self.valid?(s)
    !!(s && s.is_a?(String) && s.size == 32 && s =~ /\A[0-9a-f]{32}\Z/)
  end

  def digest
    XID.digest(self)
  end

  def self.digest(s)
    Digest::SHA256.new.update(s).to_s
  end

  def self.parse(s)
    XID.new(s.downcase.gsub(/[^0-9a-f]/,'')[0...32])
  end

end
