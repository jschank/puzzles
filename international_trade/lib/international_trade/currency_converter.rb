require 'nori'
require 'ostruct'

module InternationalTrade
  class CurrencyConverter
    def initialize
      @rates = []
    end

    def import_conversions(rates_file)
      contents = IO.read(rates_file)
      nori = Nori.new
      parser = nori.parse(contents)
      parser["rates"]["rate"].each { |hash| add_conversion(OpenStruct.new(hash)) }
      # read rates into recursive open struct
      # build a graph of nodes
      # need a method to get a path of nodes
      # need a method to apply a path of nodes - should take an array of nodes, and return an array of conversion factors
    end

    def add_conversion(conversion)
      @rates << conversion
    end

    def conversion_factors(from, to, tried = [])
      combo = (from + '-->' + to)

      conversion = @rates.find { |item| item.from == from && item.to == to }
      inverse = @rates.find{ |item| item.from == to && item.to == from}

      if from == to
        [1.0]
      elsif conversion
        [conversion.conversion.to_f]
      elsif inverse
        [1/inverse.conversion.to_f]
      else
        possibles = @rates.find_all { |item| item.from == from }
        paths = possibles.map do |item|
          next if tried.include?(combo)
          tried << combo
          [item.conversion.to_f] + conversion_factors(item.to, to, tried)
        end
        paths.compact.min_by(&:length) || []
      end

    end

    def convert(amount_with_currency, to_currency)
      amount, from_currency = amount_with_currency.split(' ')
      factors = conversion_factors(from_currency, to_currency)
      factors.map! { |factor| BigDecimal.new(factor.to_s) }

      init_amount = BigDecimal.new(amount)
      #cash = factors.inject(init_amount) { |init, item| init = (init * item).round(2, :banker ) }
      cash = factors.inject(init_amount) { |init, item| init = (init * item) }
      cash.round(2, :banker)
    end
  end
end
