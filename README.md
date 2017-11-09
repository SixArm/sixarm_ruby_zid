# SixArm.com → Ruby → <br> ZID: Xeno Identifier for foreign keys

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_zid.svg)](http://badge.fury.io/rb/sixarm_ruby_zid)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_zid.png)](https://travis-ci.org/SixArm/sixarm_ruby_zid)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_zid.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_zid)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_zid/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_zid?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_zid>
* Doc: <http://sixarm.com/sixarm_ruby_zid/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_zid>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

ZID stands for "Zen Identifier".

A ZID is a secure random id, similar to a random UUID (Universally Unique Identifier).

ZID specification:

  * Generated entirely by using a secure random generator.
  * You can use as many bits as you like, for example ZID128 is 128 bits.
  * The string representation is always hexadecimal lowecase: digits 0-9 and lowercase a-f.

See below for a comparison of ZID and UUID.

For docs go to <http://sixarm.com/sixarm_ruby_zid/doc>

Want to help? We're happy to get pull requests.


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_zid

Or add this to your Gemfile:

    gem 'sixarm_ruby_zid'

### Require

To require the gem in your code:

    require 'sixarm_ruby_zid'

<!--install-shut-->


## Details

Class methods:

  * `ZID.generate`: generate a new ZID string.
  * `ZID.valid?(string)`: is a string a valid ZID?
  * `ZID.parse(object)`: parse any object to a new ZID string.

Notes:

  * ZID uses Ruby's SecureRandom methods for strong security.
  * ZID generates a Ruby string, so you can do any string methods on it.


## UUID comparison

ZID is much like UUID:

  * ZID and UUID are both 128 bit.
  * ZID has one form. UUID has multiple forms known as variants and versions.
  * ZID mandates secure randomness. UUID has no mandate of secure randomness.
  * ZID is entirely random. UUID has a non-random variant value.
  * ZID is entirely lowercase. UUID representation and reading allows uppercase or lowercase.
  * ZID is entirely hex digits. UUID allows dashes to separate sequences.
  * ZID is always 32 characters. UUID allows 32-36 characters.

To format an ZID in the style of a UUID canonical representation:

    zid = "90f44e35a062479289ff75ab2abc0ed3"
    zid.sub(/(.{8})(.{4})(.{4})(.{16})/,"#$1-#$2-#$3-#$4")
    #=> "90f44e35-a062-4792-89ff75ab2abc0ed3"

Note: the result string is formatted like a UUID, but is not guaranteed to be valid UUID. This is because the ZID is random, whereas the UUID specification requires a specific bit that indicates the UUID is random.

To format a UUID in the style of an ZID:

    uuid = "14fFE137-2DB2-4A37-A2A4-A04DB1C756CA"
    uuid.gsub(/-/,"").downcase
    #=> ""14f7e1372db24a37a2a4a04db1c756ca"

Note: the result string is formatted like a ZID, but is not a valid ZID. This is because there's no guarantee that the UUID was randomly generated using a secure random generator, and also because the UUID-4 specification requires a random UUID to set the third section's first digit to 4.


## Unix tooling

To generate an ZID on a typical Unix system, one way is the hexdump command:

    $ hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random
    b29dd48b7040f788fd926ebf1f4eddd0

To digest an ZID by using SHA256:

    $ echo -n "b29dd48b7040f788fd926ebf1f4eddd0" | shasum -a 256
    afdfb0400e479285040e541ee87d9227d5731a7232ecfa5a07074ee0ad171c64


## Database tooling

To store an ZID in a database, one way is using a string field that is 32 characters long.

Some databases have specialize fields for 128 bit values, such as PostgreSQL and its UUID extensions. PostgreSQL states that a UUID field will accept a string that is lowercase and that omits dashes. PostgreSQL does not do any validity-checking on the UUID value. Thus it is viable to store an ZID in a UUID field. Our team has a goal to create a PostgreSQL extension for the ZID data type.

## Credits

* [Joel Parker Henderson](https://github.com/joelparkerhenderson)
* [Michael Pope](https://github.com/amorphid)
