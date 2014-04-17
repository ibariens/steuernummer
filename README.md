# Steuernummer

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

  Validate your German Steuernummer

``` ruby
   Example:
   >> tax_no = Steuernummer.new("93815/08152", 'Baden-Württemberg')
   >> tax_no.is_valid?
   => true
  
   >> tax_no.country_wide_number
   => {:number => '2893081508152', :region => 'Baden-Württemberg')
  
  # ----------------------------------------------------------------
  
   >> tax_no = Steuernummer.new("28FF0BBBUUUUP")
   >> tax_no.is_valid?
   => true
  
   >> tax_no.region_wide_number
   => {:number => '93815/08152', :region => 'Baden-Württemberg')
  
  #  ----------------------------------------------------------------

  >> tax_no = Steuernummer.new('151/815/08156','unknown')
  >> tax_no.is_valid?
  => true

  >> tax_no.region_wide_number
  => {:number => '151/815/08156', :region => 'unknown'}
 
  >> tax_no.country_wide_number
  => RuntimeError: "Can't determine country wide number for a region wide number without knowing the region...."
  
  
  #  ----------------------------------------------------------------
 
  >> Steuernummer.valid_regions
  => ["Baden-Württemberg", "Bayern", "Berlin", "Brandenburg",....]

  # Arguments:
      steuernummer: (String)
      region: (String)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
