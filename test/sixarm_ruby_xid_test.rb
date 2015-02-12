# -*- coding: utf-8 -*-
require 'minitest/autorun'
Minitest::Test ||= MiniTest::Unit::TestCase
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_xid'

describe XID do

  describe "#new" do

    describe "with initialize defaults" do

      it "is a string with the correct length and characters" do
        xid = XID.new
        xid.must_match /\A[0-9a-f]{32}\z/
      end

      it "is always different" do
        seen = Set.new
        99999.times.each{
          xid = XID.new
          seen.include?(xid).must_equal false
          seen.add(xid)
        }
      end

    end

    describe "with initialize string" do

      it "sets" do
        xid = XID.new("foo")
        xid.must_equal("foo")
      end

    end

  end

  describe "#digest" do

    it "digests" do
      xid  = XID.new
      xid.digest.must_match /\A[0-9a-f]{64}\z/
    end

  end

  describe ".digest" do

    it "digests" do
      XID.digest("foo").must_match /\A[0-9a-f]{64}\z/
    end

  end

end
