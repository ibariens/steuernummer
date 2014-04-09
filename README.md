# Steuernummer

** IMPORTANT: still 15 regex rules need to be added - should be done in 24 hours **

Steuernummer is a very simple Gem that uses regex to validate all german tax numbers (or steuernummer).
It is able to generate a country wide code, and find the region where the steuernummer comes from.
Data is based on: http://de.wikipedia.org/wiki/Steuernummer


## Installation

Add this line to your application's Gemfile:

    gem 'steuernummer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install steuernummer

## Usage

  Example:
    >> tax_no = Steuernummer.new("93815/08152")
    >> tax_no.is_valid?
    => true

     >> tax_no.region
     => 'Baden-Württemberg'

     >> tax_no.country_wide_code
     => 2893081508152

   Arguments:
     Steuernummer: (String)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
