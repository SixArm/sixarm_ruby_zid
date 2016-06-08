# -*- coding: utf-8 -*-
require "sixarm_ruby_zid_test"

describe ZID do

  describe "#new" do

    describe "with initialize defaults" do

      it "is a string with the correct length and characters" do
        zid = ZID.generate
        zid.must_match /\A[0-9a-f]{32}\z/
      end

      it "is always different" do
        seen = Set.new
        99999.times.each{
          zid = ZID.generate
          seen.include?(zid).must_equal false
          seen.add(zid)
        }
      end

    end

  end

  describe "#valid" do

    describe "with valid string" do
      it "is true" do
        ZID.valid?("c3d010bbfec046f59c7fe843d32dab32").must_be_same_as true
      end
    end

    describe "with invalid string" do
      it "is false" do
        ZID.valid?("abc").must_be_same_as false
      end
    end

  end

  describe ".parse" do

    it "converts objects to strings" do
      obj = Minitest::Mock.new
      obj.expect(:to_s, "!!C3D010BBFEC046F59C7FE843D32DAB32!!")
      ZID.parse(obj).must_equal "c3d010bbfec046f59c7fe843d32dab32"
      obj.verify
    end

    it "converts to lower case" do
      ZID.parse("C3D010BBFEC046F59C7FE843D32DAB32").must_equal "c3d010bbfec046f59c7fe843d32dab32"
    end

    it "deletes non-hex characters" do
      ZID.parse("!!c3d010bb-fec0-46f59c7f-e843d32dab32!!").must_equal "c3d010bbfec046f59c7fe843d32dab32"
    end

    it "chops at 32 characters" do
      ZID.parse("c3d010bbfec046f59c7fe843d32dab32aaaaaaaaa").must_equal "c3d010bbfec046f59c7fe843d32dab32"
    end

    it "raises if the string is invalid" do
      proc { ZID.parse("abc") }.must_raise ArgumentError
    end

  end

end
