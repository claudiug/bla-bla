require_relative '../../lib/Kata01/product'
require_relative '../../lib/Kata01/special_offer_price'
describe SpecialOfferPrice do

  it 'should understand the total price for three for a dollar' do
    product = Product.new
    product.product_name('apple')
    money = Money.new
    money.value = 1340.99
    money.currency = 'EUR'
    product.special_offer('three for a price of one')
    product.set_price(money)
    sop = SpecialOfferPrice.new(product)
    expect(sop.total_products).to eq 3
    expect(sop.total_price).to eq 1340.99

  end
end
