require "steuernummer/version"
require "steuernummer/table"


module Steuernummer
  def self.validate(tax_string)
    match_patterns = TaxTable.data.map{|x| x[:match_pattern]}
    match_patterns.each do |pattern|
        return if tax_string =~ pattern
    end
    return false
  end
end
