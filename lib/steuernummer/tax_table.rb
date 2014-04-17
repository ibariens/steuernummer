# encoding: utf-8

class Steuernummer::TaxTable
  # Puts all possible German tax regions in an data object.
  # All values are based on: http://de.wikipedia.org/wiki/Steuernummer
  # To keep it a bit readible the variable names are kept the same as
  # in the wikipedia entry.
    def self.tax_rules
      [{:region => 'Baden-Württemberg',
        :match_pattern_region => /\A(?<ff>\d{2})(?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A28(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff}#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "28#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Bayern',
        :match_pattern_region => /\A(?<fff>\d{3})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A9(?<fff>\d{3})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|fff,bbb,uuuu,p| "#{fff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|fff,bbb,uuuu,p| "9#{fff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Berlin',
        :match_pattern_region => /\A(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A11(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "11#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Brandenburg',
        :match_pattern_region => /\A0(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A30(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "0#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "30#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Bremen',
        :match_pattern_region => /\A(?<ff>\d{2})\s(?<bbb>\d{3})\s(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A24(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff} #{bbb} #{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "24#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Hamburg',
        :match_pattern_region => /\A(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A22(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "22#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Hessen',
        :match_pattern_region => /\A0(?<ff>\d{2})\s(?<bbb>\d{3})\s(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A26(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "0#{ff} #{bbb} #{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "26#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Mecklenburg-Vorpommern',
        :match_pattern_region => /\A0(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A40(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "0#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "40#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Niedersachsen',
        :match_pattern_region => /\A(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A23(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "23#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Nordrhein-Westfalen',
        :match_pattern_region => /\A(?<fff>\d{3})[\/](?<bbbb>\d{4})[\/](?<uuu>\d{3})(?<p>\d{1})\z/,
        :match_pattern_country => /\A5(?<fff>\d{3})0(?<bbbb>\d{4})(?<uuu>\d{3})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|fff,bbbb,uuu,p| "#{fff}/#{bbbb}/#{uuu}#{p}"},
        :to_country_wide => lambda {|fff,bbbb,uuu,p| "5#{fff}0#{bbbb}#{uuu}#{p}"}},

       {:region => 'Rheinland-Pfalz',
        :match_pattern_region => /\A(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})[\/](?<p>\d{1})\z/,
        :match_pattern_country => /\A27(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff}/#{bbb}/#{uuuu}/#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "27#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Saarland',
        :match_pattern_region => /\A0(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A10(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "0#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "10#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Sachsen',
        :match_pattern_region => /\A2(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A32(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "2#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "32#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Sachsen-Anhalt',
        :match_pattern_region => /\A1(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A31(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "1#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "31#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Schleswig-Holstein',
        :match_pattern_region => /\A(?<ff>\d{2})\s(?<bbb>\d{3})\s(?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A21(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "#{ff} #{bbb} #{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "21#{ff}0#{bbb}#{uuuu}#{p}"}},

       {:region => 'Thüringen',
        :match_pattern_region => /\A1(?<ff>\d{2})[\/](?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})\z/,
        :match_pattern_country => /\A41(?<ff>\d{2})0(?<bbb>\d{3})(?<uuuu>\d{4})(?<p>\d{1})\z/ ,
        :to_region_wide => lambda {|ff,bbb,uuuu,p| "1#{ff}/#{bbb}/#{uuuu}#{p}"},
        :to_country_wide => lambda {|ff,bbb,uuuu,p| "41#{ff}0#{bbb}#{uuuu}#{p}"}}
      ]
   end
end
