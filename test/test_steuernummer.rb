# encoding: utf-8
require 'test/unit'
require 'steuernummer'

class TestSteuernummer < Test::Unit::TestCase
  def setup
    # Examples taken from: http://de.wikipedia.org/wiki/Steuernummer
    @wiki_test_entries = [
      ['Baden-Württemberg', '93815/08152', '2893081508152'],
      ['Bayern', '181/815/08155', '9181081508155'],
      ['Berlin', '21/815/08150', '1121081508150'],
      ['Brandenburg', '048/815/08155', '3048081508155'],
      ['Bremen', '75 815 08152', '2475081508152'],
      ['Hamburg', '02/815/08156', '2202081508156'],
      ['Hessen', '013 815 08153', '2613081508153'],
      ['Mecklenburg-Vorpommern', '079/815/08151', '4079081508151'],
      ['Niedersachsen', '24/815/08151', '2324081508151'],
      ['Nordrhein-Westfalen', '133/8150/8159', '5133081508159'],
      ['Rheinland-Pfalz', '22/815/0815/4', '2722081508154'],
      ['Saarland', '010/815/08182', '1010081508182'],
      ['Sachsen', '201/123/12340', '3201012312340'],
      ['Sachsen-Anhalt', '101/815/08154', '3101081508154'],
      ['Schleswig-Holstein', '29/815/08158', '2129081508158'],
      ['Thüringen', '151/815/08156', '4151081508156']
    ]
  end


  def test_region_number_entries
    @wiki_test_entries.each do |wiki_entry|
      tax_number = Steuernummer.new(wiki_entry[1], wiki_entry[0])

      assert(tax_number.is_valid?, "#{wiki_entry[1]} should be marked as valid, but is marked as invalid")
      assert_equal(wiki_entry[0], tax_number.region_wide_number[:region], "Error in region: expected: #{wiki_entry[0]}, but got: #{tax_number.region_wide_number[:region]}")
      assert_equal(wiki_entry[1], tax_number.region_wide_number[:number], "Error in number: expected: #{wiki_entry[1]}, but got: #{tax_number.region_wide_number[:number]}")

      assert_equal(wiki_entry[0], tax_number.country_wide_number[:region], "Error in region: expected: #{wiki_entry[0]}, but got: #{tax_number.country_wide_number[:region]}")
      assert_equal(wiki_entry[2], tax_number.country_wide_number[:number], "Error in number: expected: #{wiki_entry[2]}, but got: #{tax_number.country_wide_number[:number]}")
    end
  end


  def test_country_number_entries
    @wiki_test_entries.each do |wiki_entry|
      tax_number = Steuernummer.new(wiki_entry[2], wiki_entry[0])

      assert(tax_number.is_valid?, "#{wiki_entry[2]} should be marked as valid, but is marked as invalid")
      assert_equal(wiki_entry[0], tax_number.region_wide_number[:region], "Error in region: expected: #{wiki_entry[0]}, but got: #{tax_number.region_wide_number[:region]}")
      assert_equal(wiki_entry[1], tax_number.region_wide_number[:number], "Error in number: expected: #{wiki_entry[1]}, but got: #{tax_number.region_wide_number[:number]}")

      assert_equal(wiki_entry[0], tax_number.country_wide_number[:region], "Error in region: expected: #{wiki_entry[0]}, but got: #{tax_number.country_wide_number[:region]}")
      assert_equal(wiki_entry[2], tax_number.country_wide_number[:number], "Error in number: expected: #{wiki_entry[2]}, but got: #{tax_number.country_wide_number[:number]}")
    end
  end

  def test_faulty_region_number_entries
    # number to long
    assert_equal(false, (Steuernummer.new('93815/08152333','Baden-Württemberg').is_valid?))
  end

  def test_needs_region
    e = assert_raise RuntimeError do
      Steuernummer.new('151/815/08156','unknown').country_wide_number
    end
    assert e.message.include? "Can't determine country wide number"
  end

  def test_faulty_country_number_entries
    # number to long
    assert_equal(false, (Steuernummer.new('28930815081522342323','Baden-Württemberg').is_valid?))
  end


  def test_should_return_array_with_possible_regions
    assert_equal(16, Steuernummer.valid_regions.count)
  end
end




