# SixArm.com » Ruby » <br> SecureToken to generate a random string

[![Code Climate](https://codeclimate.com/github/SixArm/xid.png)](https://codeclimate.com/github/SixArm/xid)
[![Build Status](https://travis-ci.org/SixArm/xid.png)](https://travis-ci.org/SixArm/xid)

* Doc: <http://sixarm.com/sixarm_ruby_xid/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_xid>
* Repo: <http://github.com/sixarm/sixarm_ruby_xid>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

XID is a secure identifier string. It is much like a UUID (Universally Unique Identifier). The XID has a more-specific specfication, faster creation algorithms, faster comparison algorithms, and is fully translatable to a UUID if necessary.

XID specification:

  * 128 bit.
  * Completely random.
  * Generated with a secure random generator.
  * The string representation is entirely hexidecimal: digits 0-9 and lowercase a-f.

Comparison with UUID:

  * The XID and UUID are both 128 bit.
  * The XID has one form. The UUID has multiple forms, called variants and versions.
  * The XID is completely random. The UUID may have non-random pieces, such as a MAC sequence, and a fixed bit for the variant and version.
  * The XID specification requires the use of a secure random generator. The UUID has no guarantee.
  * The XID uses digits 0-9 and lowecase a-f. The UUID canoncical form uses dashes to separate sequencies, and can use uppercase or lowercase.

Example:

    XID.new
    #=> "90f44e35a062479289ff75ab2abc0ed3"


For docs go to <http://sixarm.com/sixarm_ruby_xid/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_xid

Bundler:

    gem "sixarm_ruby_xid", ">=3.0.0", "<4"

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

This uses Ruby's SecureRandom methods for strong security.

SecureToken is a string, so you can do any string methods on it.


## Changes

* 2015-02-11 3.0.0 Upgrade to XID
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
