require_relative '../../lib/Kata01/money'
describe Money do

  it 'should create a new money with default value' do
    money = Money.new
    expect(money.currency).to eq 'USD'
    expect(money.value).to eq 0.00
  end

  it 'should create a new money with custom value' do
    money = Money.new
    money.value = 10.5
    expect(money.value).to eq 10.5
  end

  it 'should should create a new money with only positive value' do
    money = Money.new
    money.value = -10.0
    expect(money.value).to eq 0.0
  end

  it 'should not create money with wrong value' do
    money = Money.new
    money.value = 'a'
    expect(money.value).to be 0.0
  end

  it 'should not create money with unknown currency' do
    money = Money.new
    money.currency = 'SSS'
    expect(money.currency).to eq 'USD'
  end

  it 'should create currency with a approved currency' do
    money = Money.new
    money.currency = 'GBP'
    expect(money.currency).to eq 'GBP'
  end

end
