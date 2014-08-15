require_relative '../../lib/Kata01/store'
require_relative '../../lib/Kata01/product'
require_relative '../../lib/Kata01/money'
describe Store do

  it 'should return the number of maximum products that could be added in the store' do
    store = Store.new(10, 'EUR')
    expect(store.product_size).to eq 10
  end

  it 'should be able to add a new product for a store' do
    store = Store.new(3, 'EUR')
    money = Money.new
    money.currency = 'EUR'
    money.value = 10.0
    p1 = Product.new
    p1.set_price(money)
    store.add_product(p1)
    expect(store.list_of_products).to include(p1)
  end

  it 'should not be able to add more products if the store limit is exceed' do
    store = Store.new(3, 'EUR')
    money = Money.new
    money.currency = 'EUR'
    money.value = 10.0
    p1 = Product.new
    p2 = Product.new
    p3 = Product.new
    p4 = Product.new
    p1.set_price(money)
    p2.set_price(money)
    p3.set_price(money)
    p4.set_price(money)

    store.add_product(p1)
    store.add_product(p2)
    store.add_product(p3)
    store.add_product(p4)
    expect(store.list_of_products.size).to eq 3
  end

  it 'should be able to see all the special offers' do
    store = Store.new(3, 'EUR')
    p1 = Product.new
    p1.special_offer('special')
    p2 = Product.new
    store.add_product(p1)
    store.add_product(p2)
    expect(store.special_products).to match_array('special')
  end

  it 'should not allow products with different currency as the store' do
    store = Store.new(3,'EUR')
    #product1
    p1 = Product.new
    m = Money.new
    m.currency = 'EUR'
    p1.set_price(m)
    #product2
    p2 = Product.new
    m1 = Money.new
    m1.currency = 'USD'
    p2.set_price(m1)

    store.add_product p1
    store.add_product p2
    expect(store.list_of_products.size).to eq 1
  end
end
