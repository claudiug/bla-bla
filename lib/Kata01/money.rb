require 'byebug'
class Money

  attr_accessor :currency, :value

  def initialize
    @currency = 'USD'
    @value = 0.0
  end

  def value=(amount)
    if amount.is_a?(Float) && amount > 0
      @value = amount
    else
      @value = 0.0
    end
  end

  def currency=(currency)
    if currency_list.include? currency
      @currency = currency
    else
      @currency = 'USD'
    end
  end

  def store_price
    "#{@value} #{@currency}"
  end

  private

  def currency_list
    %w(USD EUR GBP JPY AUD INR)
  end

end
