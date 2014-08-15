class Store
  def initialize(number_of_products, currency)
    @size = number_of_products
    @products = Array.new
    @currency = currency
  end

  def information
    "number of products: #{@size} currency: #{@currency}"
  end

  def number_of_maximum_products
    @size
  end

  def add_product(product)
    @products << product if @products.size < @size product
  end

  def list_all_products_name
    @products.map(&:name)
  end

  def show_special_offers
    @products.map(&:offer).select{|sp| sp != nil}
  end
end
