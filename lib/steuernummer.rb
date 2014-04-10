# encoding: utf-8
require "steuernummer/version"
require "steuernummer/tax_table"


class Steuernummer
  # Validate your German Steuernummer
  #
  # Example:
  #   >> tax_no = Steuernummer.new("93815/08152", 'Baden-Württemberg')
  #   >> tax_no.is_valid?
  #   => true
  #
  #   >> tax_no.country_wide_number
  #   => {:number => '2893081508152', :region => Baden-Württemberg')
  #
  #  ----------------------------------------------------------------
  #
  #   >> tax_no = Steuernummer.new("28FF0BBBUUUUP")
  #   >> tax_no.is_valid?
  #   => true
  #
  #   >> tax_no.region_wide_number
  #   => {:number => '93815/08152', :region => Baden-Württemberg')
  #
  #  ----------------------------------------------------------------
  #
  # Arguments:
  #   steuernummer: (String)
  #   region: (String)
  #


  def initialize(tax_string, region = 'unknown')
    raise("Please use a String as argument") if tax_string.class != String
    unless region == 'unknown' || (Steuernummer::TaxTable.tax_regions.include? region)
      raise("unknown region, please use one of the following #{Steuernummer::TaxTable.tax_regions.join(', ')}")
    end

    @tax_string          = tax_string
    @provided_region     = region
    @tax_rules           = get_tax_rules(tax_string)
  end

  def get_tax_rules(tax_string)
    tax_rules = Array.new
    Steuernummer::TaxTable.tax_rules.each do |tax_rule|
      if tax_string =~ tax_rule[:match_pattern_region]
        tax_rules << tax_rule.merge(:type => :region)
      elsif tax_string =~ tax_rule[:match_pattern_country]
        tax_rules << tax_rule.merge(:type => :country)
      end
    end
    tax_rules
  end

  def is_valid?
    if @provided_region != 'unknown'
      regions = @tax_rules.map {|x| x[:region]}
      regions.include? @provided_region
    else
      !@tax_rules.empty?
    end
  end

  def get_number_type
    # returns :country or :region
    tax_rule = @tax_rules.uniq{|x| x[:type]}
    if tax_rule.count > 1
      raise("both country and region type found, should be impossible!")
    else
      tax_rule.first[:type]
    end
  end

  # (German: Vereinheitlichtes Bundesschema)
  def country_wide_number
    return nil if !is_valid?
    if get_number_type == :country
      {:number => @tax_string, :region => @tax_rules.first[:region]}
    elsif (@tax_rules.count > 1) && (@provided_region != 'unknown')
      tax_rule = get_tax_rule_on_region

      match_data = @tax_string.match tax_rule[:match_pattern_region]
      arguments_array = match_data.to_a
      arguments_array.shift

      country_wide = tax_rule[:to_country_wide].call *arguments_array

      {:number => country_wide, :region => tax_rule[:region]}
    else
      raise("Can't determine country wide number for a region wide
             number without knowing the region.
             Please pass one of the following as the second argument:
             #{Steuernummer::TaxTable.tax_regions.join(', ')} ")
    end
  end

  # (German: Bündesland)
  def region_wide_number
    return nil if !is_valid?
    if get_number_type == :region
      {:number => @tax_string, :region => @provided_region}
    elsif get_number_type == :country
      # country_wide_numbers only have one rule, so it's always the first
      tax_rule = @tax_rules.first

      match_data = @tax_string.match tax_rule[:match_pattern_country]
      arguments_array = match_data.to_a
      arguments_array.shift

      region_wide = tax_rule[:to_region_wide].call *arguments_array

      {:number => region_wide, :region => tax_rule[:region]}
    end
  end

  def get_tax_rule_on_region
    if @tax_rules.count > 1
      possible_regions = @tax_rules.map {|x| x[:region]}
      found_region_index = possible_regions.index @provided_region
      @tax_rules[found_region_index]
    else
      @tax_rules.first
    end
  end
end
