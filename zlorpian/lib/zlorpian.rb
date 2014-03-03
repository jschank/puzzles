class Zlorpian
  
  GLYPHS = ['-', '|', 'X', '#']
  TERMS = {GLYPHS[0] => 'zlorp', GLYPHS[1] => 'borp', GLYPHS[2] => 'daborp', GLYPHS[3] => 'traborp'}
  MAGNITUDE_SUFFIXES = ['', 'ity', 'en', 'onk', 'iffa']

  def zlorpinumeral(num)
    zlorpinumeral_non_recursive(num)
  end

  def zlorpinumeral_recursive(num)
    return GLYPHS[num] if num < GLYPHS.length
    zlorpinumeral(num / GLYPHS.length) + zlorpinumeral(num % GLYPHS.length)
  end
  
  def zlorpinumeral_non_recursive(num)
    
    glyphs = []
    return GLYPHS[num] if num == 0  
        
    while num > 0 do
      glyphs.unshift GLYPHS[num % GLYPHS.length]
      num = num / GLYPHS.length
    end
    
    glyphs.join
  end
  
  def zlorpinumeral_to_decimal(zlorpian)
    chars = zlorpian.each_char.to_a
    chars.inject(0) { |result, ch| (result * GLYPHS.length) + GLYPHS.index(ch)}
  end
  
  
  def zlorpanese(num)
    zlorpian = zlorpinumeral(num)
    magnitudes = []
    zlorpian.reverse.each_char.to_a.each_with_index do |ch, i|
      magnitudes << (TERMS[ch] + MAGNITUDE_SUFFIXES[i])
    end
    magnitudes = magnitudes.reject{ |mag| mag.start_with?(TERMS[GLYPHS[0]]) }.reverse
    magnitudes << TERMS[GLYPHS[0]] if magnitudes.empty?
    magnitudes.join
  end

end