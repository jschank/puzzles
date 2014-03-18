require 'minitest_helper'

# test chessboard functionality
class CurrencyConverterTest < MiniTest::Test
  def setup
    @converter = CurrencyConverter.new
  end

  def test_conversion
    assert_equal(43.23, @converter.convert("43.23 USD", "CAD"), 'Convert USD to CAD')
  end

  def test_conversion_factors_for_sample_rates
    @converter.import_conversions('resources/SAMPLE_RATES.xml')
    # verify no conversions for unknow currencies
    assert_equal([], @converter.conversion_factors('XXX', 'YYY'), 'Conversion factors for XXX to YYY conversion')

    # these exist directly in the file
    assert_equal([1.0090], @converter.conversion_factors('CAD', 'USD'), 'Conversion factors for CAD to USD')
    assert_equal([0.9911], @converter.conversion_factors('USD', 'CAD'), 'Conversion factors for USD to CAD')
    assert_equal([1.0079], @converter.conversion_factors('AUD', 'CAD'), 'Conversion factors for AUD to CAD')

    # this is deduced by short-circuit
    assert_equal([1.0], @converter.conversion_factors('AUD', 'AUD'), 'Conversion factors for AUD to AUD')

    # this is deduced by taking the reciprocal
    assert_equal([0.9921619208254787], @converter.conversion_factors('CAD', 'AUD'), 'Conversion factors for CAD to AUD')

    # this is deduced by going through AUD --> CAD --> USD
    assert_equal([1.0079, 1.0090], @converter.conversion_factors('AUD', 'USD'), 'Conversion factors for AUD to USD')
  end

  def test_conversion_factors_for_rates
    @converter.import_conversions('resources/RATES.xml')

    # these exist directly in the file
    assert_equal([1.0079], @converter.conversion_factors('AUD', 'CAD'), 'Conversion factors for AUD to CAD')
    assert_equal([0.7439], @converter.conversion_factors('AUD', 'EUR'), 'Conversion factors for AUD to EUR')
    assert_equal([0.9921], @converter.conversion_factors('CAD', 'AUD'), 'Conversion factors for CAD to AUD')
    assert_equal([1.0090], @converter.conversion_factors('CAD', 'USD'), 'Conversion factors for CAD to USD')
    assert_equal([1.3442], @converter.conversion_factors('EUR', 'AUD'), 'Conversion factors for EUR to AUD')
    assert_equal([0.9911], @converter.conversion_factors('USD', 'CAD'), 'Conversion factors for USD to CAD')

    # this is deduced by going through EUR --> AUD --> CAD --> USD
    assert_equal([1.3442, 1.0079, 1.0090], @converter.conversion_factors('EUR', 'USD'), 'Conversion factors for EUR to USD')
  end

  def test_convert
    @converter.import_conversions('resources/RATES.xml')

    assert_equal( 99.11, @converter.convert('100.00 USD', 'CAD'), 'Convert USD to CAD')
    assert_equal( 136.70, @converter.convert('100.00 EUR', 'USD'), 'Convert EUR to USD')
  end

end
