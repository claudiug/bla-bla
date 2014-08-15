
require_relative '../../lib/Kata01/money_ratio'
require_relative '../../lib/Kata01/money'
describe MoneyRatio do

  it 'should proper convert from a currency to other currency' do
    money1 = Money.new
    money1.currency = 'EUR'
    money1.value = 100.00
    money_ratio = MoneyRatio.new(money1)
    money_ratio.convert_to('USD')
    expect(money_ratio.result).to eq (133.92)
  end
end
