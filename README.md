# SixArm.com » Ruby » <br> XID: Xeno Identifier for foreign keys

<!--HEADER-OPEN-->

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_xid.git.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_xid.git)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_xid.git.png)](https://travis-ci.org/SixArm/sixarm_ruby_xid.git)

* Git: <https://github.com/sixarm/sixarm_ruby_xid.git>
* Doc: <http://sixarm.com/sixarm_ruby_xid/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_xid>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Changes: See CHANGES.md file.
* License: See LICENSE.md file.
* Helping: See CONTRIBUTING.md file.

<!--HEADER-SHUT-->


## Introduction

XID stands for "Xeno Identifier" and is a stronger, safer, faster ID than a UUID (Universally Unique Identifier).

Example:

    XID.new
    #=> "90f44e35a062479289ff75ab2abc0ed3"

XID specification:

  * 128 bit.
  * Completely random and generated with a secure random generator.
  * The string representation is entirely hexidecimal: digits 0-9 and lowercase a-f.

See below for a comparison of XID and UUID.

For docs go to <http://sixarm.com/sixarm_ruby_xid/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_xid", ">= 3.4.1", "< 4"

To install using the command line, run this:

    gem install sixarm_ruby_xid -v ">= 3.4.1, < 4"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_xid -v ">= 3.4.1, < 4" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_xid"

<!--INSTALL-SHUT-->


## Details

Methods:

  * `XID.new`: create an XID and initialize to a random string.
  * `XID.new(s)`: create an XID and initialize to a given string.
  * `XID.valid?`: is an XID valid, i.e. the correct format?
  * `XID#valid?(s)`: is a string a valid XID, i.e. the correct format?
  * `XID#digest`: return a SHA256 digest as a 64-character string.
  * `XID.digest(s)`: return a SHA256 digest as a 64-character string.
  * `XID.parse(s)`: parse any string with enough data to a new XID.

Notes:

  * XID uses Ruby's SecureRandom methods for strong security.
  * An XID is a Ruby string, so you can do any string methods on it.


## UUID comparison

XID is much like UUID:

  * XID and UUID are both 128 bit.
  * XID has one form. UUID has multiple forms known as variants and versions.
  * XID mandates secure randomness. UUID has no mandate of secure randomness.
  * XID is entirely random. UUID has a non-random variant value.
  * XID is entirely lowercase. UUID allows uppercase or lowercase.
  * XID is entirely hex digits. UUID allows dashes to separate sequences.
  * XID is always 32 characters. UUID allows 32-36 characters.

To format an XID in the style of a UUID canonical representation:

    xid = "90f44e35a062479289ff75ab2abc0ed3"
    xid.sub(/(.{8})(.{4})(.{4})(.{16})/,"#$1-#$2-#$3-#$4")
    #=> "90f44e35-a062-4792-89ff75ab2abc0ed3"

Note: the result string is formatted like a UUID, but is not guaranteed to be valid UUID. This is because the XID is random, whereas the UUID specification requires a specific bit that indicates the UUID is random.

To format a UUID in the style of an XID:

    uuid = "14fFE137-2DB2-4A37-A2A4-A04DB1C756CA"
    uuid.gsub(/-/,"").downcase
    #=> ""14f7e1372db24a37a2a4a04db1c756ca"

Note: the result string is formatted like a XID, but is not a valid XID. This is because there's no guarantee that the UUID was randomly generated using a secure random generator, and also because the UUID-4 specification requires a random UUID to set the third section's first digit to 4.


## Unix tooling

To generate an XID on a typical Unix system, one way is the hexdump command:

    $ hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random
    b29dd48b7040f788fd926ebf1f4eddd0

To digest an XID by using SHA256:

    $ echo -n "b29dd48b7040f788fd926ebf1f4eddd0" | shasum -a 256
    afdfb0400e479285040e541ee87d9227d5731a7232ecfa5a07074ee0ad171c64


## Database tooling

To store an XID in a database, one way is using a string field that is 32 characters long.

Some databases have specialize fields for 128 bit values, such as PostgreSQL and its UUID extensions. PostgreSQL states that a UUID field will accept a string that is lowercase and that omits dashes. PostgreSQL does not do any validity-checking on the UUID value. Thus it is viable to store an XID in a UUID field. Our team has a goal to create a PostgreSQL extension for the XID data type.
