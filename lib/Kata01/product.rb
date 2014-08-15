require_relative '../../lib/Kata01/money'
class Product

  attr_reader :price, :name, :offer, :money
  def initialize
    @price = Money.new.store_price
    @name = 'foo'
    @offer = nil
  end



  def product_name(name)
    @name = name.capitalize
  end

  def special_offer(name)
    @offer = name
  end

  def set_price(money)
    @price = money.store_price
    @money = money
  end

  def product_information
    "[#{@name} #{@price} #{@offer}]"
  end


end
