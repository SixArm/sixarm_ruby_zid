# -*- coding: utf-8 -*-
=begin rdoc
XID class.
=end

require "securerandom"
require "digest/sha2"

class XID < String

  # Initialize a new XID, optionally with a string.
  #
  # Example:
  #
  #     xid = XID.new
  #
  #     xid = XID.new("4bb88af57d4ddc224fecad688442423d")
  #
  # Return: [XID] A new XID
  #
  def initialize(s = nil)
    s and (XID.valid?(s) or raise ArgumentError)
    super(s || SecureRandom.hex)
  end

  # Is this XID valid?
  #
  # Example:
  #
  #     xid = XID.new
  #     xid.valid? #=> true
  #
  # Return: [true/false]
  #
  def valid?
    XID.valid?(self)
  end

  # Is a given XID string valid?
  #
  # Example:
  #
  #     XID.valid?("4bb88af57d4ddc224fecad688442423d") #=> true
  #     XID.valid?("hello") #=> false
  #
  # Return: [true/false]
  #
  def self.valid?(s)
    !!(s && s.is_a?(String) && s.size == 32 && s =~ /\A[0-9a-f]{32}\Z/)
  end

  # Compute the XID digest of this XID.
  #
  # This is useful for proving knowledge of the XID,
  # without needed to expose the XID.
  #
  # Example:
  #
  #     xid = XID.new("4bb88af57d4ddc224fecad688442423d")
  #     xid.digest
  #     #=> 4d648be0ca9dbb9e3a1b6b30b9d13c79ecbc0818dfca4125cc7961e32d61112c
  #
  def digest
    XID.digest(self)
  end

  # Compute the XID digest of a given string.
  #
  # This is useful for proving knowledge of the XID,
  # without needed to expose the XID.
  #
  # Example:
  #
  #     xid = XID.new("4bb88af57d4ddc224fecad688442423d")
  #     xid.digest
  #     #=> 4d648be0ca9dbb9e3a1b6b30b9d13c79ecbc0818dfca4125cc7961e32d61112c
  #
  def self.digest(s)
    Digest::SHA256.new.update(s).to_s
  end

  # Parse a string to an XID.
  #
  # This does three steps:
  #
  #   * downcase
  #   * delete any non-hex characters
  #   * take the first 32 characters
  #
  # Example:
  #
  #     xid = XID.parse("***FFAD30A1-BE5E-B511-9ED8-976CAB0281B6***")
  #     #=> "ffad30a1be5eb5119ed8976cab0281b6"
  #
  # Return: [XID] A new XID
  #
  def self.parse(s)
    XID.new(s.downcase.gsub(/[^0-9a-f]/,'')[0...32])
  end

end
