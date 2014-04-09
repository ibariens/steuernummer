module Steuernummer
  class TaxTable
    def self.data
        [{:region => 'Baden-Wurttemberg',
          :match_pattern => /(?<ff>\d{2})(?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})/,
          :to_country_wide => lambda {|ff,bbb,uuuu,p| "28#{ff}0#{bbb}#{uuuu}#{p}"}},

         {:region => 'Baden-Wurttemberg',
          :match_pattern => /(?<ff>\d{2})(?<bbb>\d{3})[\/](?<uuuu>\d{4})(?<p>\d{1})/,
          :to_country_wide => lambda {|ff,bbb,uuuu,p| "28#{ff}0#{bbb}#{uuuu}#{p}"}}
      ]
    end
  end
end