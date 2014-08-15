require_relative '../../lib/Kata01/product'
require_relative '../../lib/Kata01/money'
describe Product do

  it 'should return a product with default values' do
    product = Product.new
    expect(product.name).to eq 'foo'
    expect(product.offer).to be_nil
    expect(product.price).to eq '0.0 USD'
  end

  it 'should able to set name for a product' do
    product = Product.new
    product.product_name('apple mac book pro 13')
    expect(product.name).to eq  'Apple mac book pro 13'
  end

  it 'should be able to set special offer for a product' do
    product = Product.new
    product.special_offer('buy one second free')
    expect(product.offer).to eq 'buy one second free'
  end

  it 'should be able to set price for a product' do
    product = Product.new
    money = Money.new
    money.value = 120.00
    money.currency= 'EUR'
    product.set_price(money)
    expect(product.price).to eq '120.0 EUR'
  end

  xit 'should be able to set price for a product. stub style' do
    product = Product.new
    money = double
    expect(money).to receive(:new).and_return(money)
    expect(money).to receive(:value).and_return(12.0)
    expect(money).to receive(:currency).and_return('EUR')
    expect(money).to receive(:store_price).and_return('12.0 EUR')
    expect(product.set_price(money)).to eq '12.0 EUR'
  end
end
