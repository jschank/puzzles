require 'minitest/autorun'
require './lib/zlorpian'

class ZlorpianTest < MiniTest::Unit::TestCase
  
  def setup
    @zlorpian = Zlorpian.new
  end
  
  def test_it_exists
    assert_kind_of Zlorpian, @zlorpian
  end
  
  def test_it_implements_zlorpinumeral
    assert_respond_to(@zlorpian, :zlorpinumeral)
  end
  
  def test_it_converts_integers_to_zlorpinumerals
    assert_equal '-', @zlorpian.zlorpinumeral(0)
    assert_equal '|', @zlorpian.zlorpinumeral(1)
    assert_equal 'X', @zlorpian.zlorpinumeral(2)
    assert_equal '#', @zlorpian.zlorpinumeral(3)
    assert_equal '|-', @zlorpian.zlorpinumeral(4)
    assert_equal '||', @zlorpian.zlorpinumeral(5)
    assert_equal '##', @zlorpian.zlorpinumeral(15)
    assert_equal '|--', @zlorpian.zlorpinumeral(16)
    assert_equal '|-|', @zlorpian.zlorpinumeral(17)
    assert_equal '#-X-', @zlorpian.zlorpinumeral(200)
    assert_equal '#|#|', @zlorpian.zlorpinumeral(221)
    assert_equal '#X#|', @zlorpian.zlorpinumeral(237)
    assert_equal '##XX|', @zlorpian.zlorpinumeral(1001)    
  end

  def test_it_implements_zlorpanese
    assert_respond_to(@zlorpian, :zlorpanese)
  end

  def test_it_converts_integers_to_zlorpanese
    assert_equal 'zlorp', @zlorpian.zlorpanese(0)
    assert_equal 'borp', @zlorpian.zlorpanese(1)
    assert_equal 'daborp', @zlorpian.zlorpanese(2)
    assert_equal 'traborp', @zlorpian.zlorpanese(3)
    assert_equal 'borpity', @zlorpian.zlorpanese(4)
    assert_equal 'borpityborp', @zlorpian.zlorpanese(5)
    assert_equal 'borpitydaborp', @zlorpian.zlorpanese(6)
    assert_equal 'borpitytraborp', @zlorpian.zlorpanese(7)
    assert_equal 'daborpity', @zlorpian.zlorpanese(8)
    assert_equal 'daborpityborp', @zlorpian.zlorpanese(9)
    assert_equal 'daborpitydaborp', @zlorpian.zlorpanese(10)
    assert_equal 'traborpitytraborp', @zlorpian.zlorpanese(15)
    assert_equal 'borpen', @zlorpian.zlorpanese(16)
    assert_equal 'borpenborp', @zlorpian.zlorpanese(17)
    assert_equal 'borpenborpityborp', @zlorpian.zlorpanese(21)
    assert_equal 'traborponkdaborpity', @zlorpian.zlorpanese(200)
    assert_equal 'traborponkborpentraborpityborp', @zlorpian.zlorpanese(221)
    assert_equal 'traborponkdaborpentraborpityborp', @zlorpian.zlorpanese(237)
    assert_equal 'traborpiffatraborponkdaborpendaborpityborp', @zlorpian.zlorpanese(1001)    
  end

  def test_it_implements_zlorpinumeral_to_decimal
    assert_respond_to(@zlorpian, :zlorpinumeral_to_decimal)
  end

  def test_it_converts_zlorpinumeral_to_decimal
    assert_equal 0, @zlorpian.zlorpinumeral_to_decimal('-')
    assert_equal 1, @zlorpian.zlorpinumeral_to_decimal('|')
    assert_equal 2, @zlorpian.zlorpinumeral_to_decimal('X')
    assert_equal 3, @zlorpian.zlorpinumeral_to_decimal('#')
    assert_equal 4, @zlorpian.zlorpinumeral_to_decimal('|-')
    assert_equal 5, @zlorpian.zlorpinumeral_to_decimal('||')
    assert_equal 15, @zlorpian.zlorpinumeral_to_decimal('##')
    assert_equal 16, @zlorpian.zlorpinumeral_to_decimal('|--')
    assert_equal 17, @zlorpian.zlorpinumeral_to_decimal('|-|')
    assert_equal 200, @zlorpian.zlorpinumeral_to_decimal('#-X-')
    assert_equal 221, @zlorpian.zlorpinumeral_to_decimal('#|#|')
    assert_equal 237, @zlorpian.zlorpinumeral_to_decimal('#X#|')
    assert_equal 1001, @zlorpian.zlorpinumeral_to_decimal('##XX|')    
  end

end
