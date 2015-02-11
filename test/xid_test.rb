# -*- coding: utf-8 -*-
require 'minitest/autorun'
Minitest::Test ||= MiniTest::Unit::TestCase
require 'simplecov'
SimpleCov.start
require 'xid'

describe XID do

  describe "#new" do

    it "is a string with the correct length and characters" do
      xid = XID.new
      xid.must_match /\A[0-9a-z]{32}\Z/
    end

    it "is always different" do
      seen = Set.new
      999999.times.each{
        xid = XID.new
        seen.include?(xid).must_equal false
        seen.add(xid)
      }
    end

  end

end
