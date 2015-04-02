# SixArm.com » Ruby » <br> XID excellent identifier

[![Code Climate](https://codeclimate.com/github/SixArm/xid.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_xid)
[![Build Status](https://travis-ci.org/SixArm/xid.png)](https://travis-ci.org/SixArm/sixarm_ruby_xid)

* Doc: <http://sixarm.com/sixarm_ruby_xid/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_xid>
* Repo: <http://github.com/sixarm/sixarm_ruby_xid>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

XID is an excellent identifier. The XID much like a UUID (Universally Unique Identifier) or GUID (Globally Unique Identifer).

Example:

    XID.new
    #=> "90f44e35a062479289ff75ab2abc0ed3"

What makes the XID excellent: a streamlined specfication, stronger security, speedier algorithms, and simple string comparisons.

XID specification:

  * 128 bit.
  * Completely random and generated with a secure random generator.
  * The string representation is entirely hexidecimal: digits 0-9 and lowercase a-f.

For docs go to <http://sixarm.com/sixarm_ruby_xid/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_xid

Bundler:

    gem "sixarm_ruby_xid", ">=3.4.0", "<4"

Require:

    require "sixarm_ruby_xid"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_xid --trust-policy HighSecurity


## Details

Methods:

  * `XID.new`: create an XID and initialize to a random string.
  * `XID.new(s)`: create an XID and initialize to a given string.
  * `XID.valid?`: is this XIDa valid, i.e. the correct format?
  * `XID#valid?(s)`: is a string a valid XID, i.e. the correct format?
  * `XID#digest`: return a SHA256 digest as a 64-character string.
  * `XID.digest(s)`: return a SHA256 digest as a 64-character string.
  * `XID.parse(s)`: parse any string with enough data to a new XID.

Notes:

  * XID uses Ruby's SecureRandom methods for strong security.
  * An XID is a Ruby string, so you can do any string methods on it.


## UUID comparison

The XID is much like a UUID:

  * The XID and UUID are both 128 bit.
  * The XID has one form. The UUID has multiple forms, known as variants and versions.
  * The XID is completely random. The UUID may have non-random pieces, such as a MAC sequence, and a fixed bit for the variant and version.
  * The XID specification requires the use of a secure random generator. The UUID has no guarantee, and some forms use predicatable sequences.
  * The XID uses digits 0-9 and lowecase a-f. The UUID canoncical form uses dashes to separate sequencies, and may use uppercase or lowercase.

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


## Changes

* 2015-04-01 3.4.0 Add XID.parse and XID.valid?
* 2015-02-12 3.3.0 Add XID.digest(s)
* 2015-02-12 3.2.0 Add XID.new(s) to initialize with a given string.
* 2015-02-12 3.1.0 Add #digest.
* 2015-02-11 3.0.0 Upgrade to XID.
* 2013-08-20 2.1.0 Add #next to enable using this as an enumeration.
* 2013-08-18 2.0.0 Upgrade for Ruby 2.0.0; add .length and .choices methods.
* 2012-03-21 1.4.0 Upgrade for Ruby 1.9.3, minitest/spec, and improved docs.
* 2011-04-22 1.3.0 Update to 32 characters
* 2011-04-21 1.2.2 End support for Ruby 1.8.6


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind,
express or implied, including but not limited to the warranties of
merchantability, fitness for a particular purpose and noninfringement.

In no event shall the authors or copyright holders be liable for any
claim, damages or other liability, whether in an action of contract,
tort or otherwise, arising from, out of or in connection with the
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights,
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
