# encoding: utf-8

class Steuernummer::TaxTable
  # Puts all possible German tax regions in an data object.
  # All values are based on: http://de.wikipedia.org/wiki/Steuernummer
  # To keep it a bit readible the variable names are kept the same as
  # in the wikipedia entry.

    def self.data
      [{:region => 'Baden-Württemberg',
        :match_pattern => /(?<ff>\d{2})(?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})/,
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "28#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Baden-Wurttemberg2',
        :match_pattern => /(?<fgs>\d{2})(?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})/,
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "28#{ff}0#{bbb}#{uuuu}#{p}"}}
      ]
   end
end
