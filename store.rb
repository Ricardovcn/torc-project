require 'bigdecimal'

def round_nearest_005(float_num)
  ((float_num * 20).ceil / 20.0).round(2)
end

def calculate_taxes(product)
  total_price = product[:price]

  imported_tax = product[:imported] ? round_nearest_005((total_price * 5 / 100)) : 0
  basic_tax = product[:taxable] ? round_nearest_005((total_price * 10 / 100)) : 0

  price_with_taxes = (BigDecimal(total_price, 10) + BigDecimal(basic_tax, 10) + BigDecimal(imported_tax, 10))
  (price_with_taxes * BigDecimal(product[:qty], 10)).to_f
end
