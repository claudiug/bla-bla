require_relative '../../lib/Kata01/store'
require_relative '../../lib/Kata01/product'
require_relative '../../lib/Kata01/money'
describe Store do

  it 'should return a store with number of products and currency' do
    store = Store.new(100, 'EUR')
    expect(store.information).to eq 'number of products: 100 currency: EUR'
  end

  it 'should return the numbers of products created' do
    store = Store.new(10, 'EUR')
    expect(store.number_of_maximum_products).to eq 10
  end

  it 'should be able to add a new product for a store' do
    store = Store.new(3, 'EUR')
    product = Product.new
    product1 = Product.new
    product2 = Product.new
    store.add_product(product)
    store.add_product(product1)
    store.add_product(product2)
    expect(store.list_all_products_name).to match_array(%w(foo foo foo))
  end

  it 'should not be able to add more products if the store limit is exceed' do
    store = Store.new(2, 'EUR')
    product = Product.new
    product1 = Product.new
    product2 = Product.new
    store.add_product product
    store.add_product product1
    store.add_product product2
    expect(store.list_all_products_name.size).to eq 2
  end

  it 'should be able to see all the special offers' do
    store = Store.new(3, 'EUR')
    product = Product.new
    product.special_offer('all at half price')
    product1 = Product.new
    product1.special_offer('buy two, get one free')
    product2 =  Product.new
    store.add_product product
    store.add_product product1
    store.add_product product2
    expect(store.show_special_offers).to eq ['all at half price', 'buy two, get one free']
  end

  it 'should not allow products with different currency as the store' do
    store = Store.new(2, 'EUR')
    product = Product.new
    product.product_name('foo')
    money = Money.new
    money.currency = 'EUR'
    money.value = 10.0
    product.set_price(money)
    product1 = Product.new
    product1.product_name('bar')
    money1 = Money.new
    money.currency = 'USD'
    money1.value = 23.0
    product1.set_price(money1)
    store.add_product(product)
    store.add_product(product1)
    expect(store.list_all_products_name).to_not eq('bar')
  end
end
