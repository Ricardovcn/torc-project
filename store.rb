require 'bigdecimal'

def round_nearest(float_num)
  ((float_num * 20).ceil / 20.0).round(2)
end

def calculate_taxes(product)
  imported_tax = product[:imported] ? round_nearest((product[:price] * 5 / 100)) : 0
  basic_tax = product[:taxable] ? round_nearest((product[:price] * 10 / 100)) : 0

  total_taxes = BigDecimal(basic_tax, 10) + BigDecimal(imported_tax, 10)
  price_with_taxes = (BigDecimal(product[:price], 10) + total_taxes)
  {
    total_price: (price_with_taxes * BigDecimal(product[:qty], 10)).to_f,
    taxes: (total_taxes * BigDecimal(product[:qty], 10)).to_f,
  }
end

def generate_receipt_details(products)
  products_with_taxes = []
  total_taxes = 0

  products.each do |product|
    product_with_taxes = calculate_taxes(product)
    products_with_taxes.append(product_with_taxes[:total_price])
    total_taxes += BigDecimal(product_with_taxes[:taxes], 10)
  end

  {
    products: products_with_taxes,
    sales_taxes: total_taxes.to_f,
    total: products_with_taxes.sum
  }
end
