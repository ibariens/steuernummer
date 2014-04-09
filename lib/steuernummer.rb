# encoding: utf-8
require "steuernummer/version"
require "steuernummer/tax_table"


class Steuernummer
  # Validate your German Steuernummer
  #
  # Example:
  #   >> tax_no = Steuernummer.new("93815/08152")
  #   >> tax_no.is_valid?
  #   => true
  #
  #   >> tax_no.region
  #   => 'Baden-Württemberg'
  #
  #   >> tax_no.country_wide_code
  #   => 2893081508152
  #
  # Arguments:
  #   Steuernummer: (String)


  def initialize(tax_string)
    raise("Please use a String as argument") if tax_string.class != String

    @tax_string = tax_string
    @tax_rule = get_tax_rule(tax_string)
  end

  def get_tax_rule(tax_string)
    Steuernummer::TaxTable.data.each do |tax_rule|
      if tax_string =~ tax_rule[:match_pattern]
        tax_rule
        break
      end
    end
    # If no tax rule found, return nil
    nil
  end

  def is_valid?
    !@tax_rule.nil?
  end

  # (German: Bündesland)
  def region
    if is_valid?
      @tax_rule[:region]
    end
  end

  # (German: Vereinheitlichtes Bundesschema)
  def country_wide_code
    if is_valid?
      match_data = @tax_string.match @tax_rule[:match_pattern]
      match_data_array = match_data.to_a
      match_data_array.shift
      country_wide = @tax_rule[:to_country_wide].call *match_data_array
    end
  end
end
