# -*- coding: utf-8 -*-
=begin rdoc
XID class.
=end

require "securerandom"
require "digest/sha2"

class XID

  # Generate a new XID string.
  #
  # Example:
  #
  #     string = XID.generate
  #     #=> "4bb88af57d4ddc224fecad688442423d"
  #
  # Return: [String] A new XID string
  #
  def self.generate
    SecureRandom.hex
  end

  # Is a given XID string valid?
  #
  # Example:
  #
  #     XID.valid?("4bb88af57d4ddc224fecad688442423d") #=> true
  #     XID.valid?("hello") #=> false
  #
  # Implemenation note: this method tests the string class,
  # then length, then regex. The test of the string length
  # is an optimization for fast-fail because when the string
  # is not size 32, then the regex doesn't need to run.
  #
  # Return: [true/false]
  #
  def self.valid?(string)
    !!(string && string.is_a?(String) && string.size == 32 && string =~ /\A[0-9a-f]{32}\z/)
  end

  # Parse any object to an XID string.
  #
  # This does these steps:
  #
  #   * Convert the object to a string by calling `#to_s`.
  #   * Convert the string to lower case by calling `#downcase`.
  #   * Delete any non-hex characters.
  #   * Take the first 32 characters.
  #
  # Example:
  #
  #     string = XID.parse("***FFAD30A1-BE5E-B511-9ED8-976CAB0281B6***")
  #     #=> "ffad30a1be5eb5119ed8976cab0281b6"
  #
  # Return: [XID] A new XID
  #
  def self.parse(object)
    xid = object.to_s.downcase.gsub(/[^0-9a-f]/,'')[0...32]
    raise ArgumentError if !XID.valid?(xid)
    xid
  end

end
