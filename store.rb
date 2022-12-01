require 'bigdecimal'

def round_nearest(float_num)
  ((float_num * 20).ceil / 20.0).round(2)
end

def imported_taxes(price, imported)
  imported ? round_nearest((price * 5 / 100)) : 0
end

def basic_taxes(price, taxable)
  taxable ? round_nearest((price * 10 / 100)) : 0
end

def calculate_total_taxes(basic_tax, imported_tax)
  BigDecimal(basic_tax, 10) + BigDecimal(imported_tax, 10)
end

def calculate_taxes(product)
  imported_tax = imported_taxes(product[:price], product[:imported])
  basic_tax = basic_taxes(product[:price], product[:taxable])

  total_taxes = calculate_total_taxes(basic_tax, imported_tax)
  price_with_taxes = (BigDecimal(product[:price], 10) + total_taxes)

  {
    total_price: (price_with_taxes * BigDecimal(product[:qty], 10)).to_f,
    taxes: (total_taxes * BigDecimal(product[:qty], 10)).to_f
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

def print_receipt(products, receipt)
  products.each_with_index do |product, i|
    imported = product[:imported] ? 'imported' : ''
    puts "#{product[:qty]} #{imported}  #{product[:name]}: #{format('%.2f', receipt[:products][i])}"
  end
  puts "Sales Taxes: #{format('%.2f', receipt[:sales_taxes])}"
  puts "Total: #{format('%.2f', receipt[:total])}"
end
