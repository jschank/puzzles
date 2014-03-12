module InternationalTrade
  class CurrencyConverter
    def initialize(rates_file)
      # read rates into recursive open struct
      # build a graph of nodes
      # need a method to get a path of nodes
      # need a method to apply a path of nodes - should take an array of nodes, and return an array of conversion factors
    end

    def convert(amount, target_currency)
      amount, source_currency = amount.split(' ')
      amount.to_f
    end
  end
end
