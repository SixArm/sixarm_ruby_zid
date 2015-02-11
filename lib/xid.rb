# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

require 'securerandom'

class XID < String

  def initialize
    super(SecureRandom.hex(16))
  end

end
