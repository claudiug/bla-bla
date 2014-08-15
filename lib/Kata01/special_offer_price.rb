class SpecialOfferPrice

  def initialize(product)
    @product = product
    @numbers = set_numbers
  end

  def set_numbers
    {
        'one'=> 1,
        'two'=> 2,
        'three'=> 3,
        'four'=> 4,
        'five'=> 5,
        'six'=> 6,
        'seven'=> 7,
        'eight'=> 8,
        'nine'=> 9,
        'ten'=> 10
    }
  end

  def total_products
    # code here
  end

  def total_price
    # code here
  end

  def buy(i)
    # code here
  end

  def translate_special_price
    rr = []
    result = @product.special_offer.split( )
    result.each do |r|
      if set_numbers['r'] != nil
        rr << r
      end
    end
  end


end
