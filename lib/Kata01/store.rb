class Store
  attr_reader :product_size

  def initialize(product_size, currency)
    @product_size = product_size
    @currency = currency
    @list_of_products = []
  end

  def add_product(product)
    @list_of_products << product if store_has_space? && is_valid?(product)
    byebug
  end


  def list_of_products
    @list_of_products
  end

  def special_products
    @list_of_products.map(&:offer).select{|sp| sp != nil}
  end

  private

  def is_valid?(product)
    product.money.currency == @currency
  end

  def store_has_space?
    @list_of_products.size < @product_size
  end
end
