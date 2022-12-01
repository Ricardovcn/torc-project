require 'bigdecimal'

def round_nearest(float_num)
  ((float_num * 20).ceil / 20.0).round(2)
end

def calculate_taxes(product)
  imported_tax = product[:imported] ? round_nearest((product[:price] * 5 / 100)) : 0
  basic_tax = product[:taxable] ? round_nearest((product[:price] * 10 / 100)) : 0

  price_with_taxes = (BigDecimal(product[:price], 10) + BigDecimal(basic_tax, 10) + BigDecimal(imported_tax, 10))
  (price_with_taxes * BigDecimal(product[:qty], 10)).to_f
end

def generate_receipt_details(products)
  prices_list_with_taxes = products.map do |product|
    calculate_taxes(product)
  end

  {
    products: prices_list_with_taxes,
    #sales_taxes: nil,
    total: prices_list_with_taxes.sum
  }
end
