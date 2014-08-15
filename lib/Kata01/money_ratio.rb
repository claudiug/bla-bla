class MoneyRatio

  def initialize(money)
    @value = money.value
    @currency = money.currency
    @rates = set_rates
  end

  def set_rates
    {
    'EUR_USD' => 1.339209,
    'EUR_GBP' => 1.246610,
    'EUR_INR' => 81.442089,
    'EUR_AUD' => 1.438290,
    'EUD_JPY' => 1.438290
    }
  end



  def convert_to(c)
    @result = @value * @rates["#{@currency}_#{c}"]
  end

  def result
    @result.round(2)
  end

end
