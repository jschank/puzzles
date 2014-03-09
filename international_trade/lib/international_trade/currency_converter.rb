module InternationalTrade
  class CurrencyConverter
    def initialize(rates_file)
    end

    def convert(amount, target_currency)
      amount, source_currency = amount.split(' ')
      amount.to_f
    end
  end
end