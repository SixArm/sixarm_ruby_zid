# -*- coding: utf-8 -*-
=begin rdoc
ZID class.
=end

require "securerandom"
require "digest/sha2"

class ZID

  # Generate a new ZID string.
  #
  # Example:
  #
  #     string = ZID.generate
  #     #=> "4bb88af57d4ddc224fecad688442423d"
  #
  # Return: [String] A new ZID string
  #
  def self.generate
    SecureRandom.hex
  end

  # Is a given ZID string valid?
  #
  # Example:
  #
  #     ZID.valid?("4bb88af57d4ddc224fecad688442423d") #=> true
  #     ZID.valid?("hello") #=> false
  #
  # Implemenation note: this method tests the string class,
  # then size, then regex. The test of the string size comes
  # before the regex because the test of the size runs faster,
  # and is an optimization for fast-fail because when the string
  # is not size 32, then the regex doesn't need to be run.
  #
  # Return: [true/false]
  #
  def self.valid?(string)
    !!(string && string.is_a?(String) && string.size == 32 && string =~ /\A[0-9a-f]+\z/)
  end

  # Parse any object to an ZID string.
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
  #     string = ZID.parse("***FFAD30A1-BE5E-B511-9ED8-976CAB0281B6***")
  #     #=> "ffad30a1be5eb5119ed8976cab0281b6"
  #
  # Return: [ZID] A new ZID
  #
  def self.parse(object)
    zid = object.to_s.downcase.gsub(/[^0-9a-f]/,'')[0...32]
    raise ArgumentError if !ZID.valid?(zid)
    zid
  end

end
