require_relative './store'

products = [
  {
    name: 'book',
    qty: 2,
    price: 12.49,
    imported: false,
    taxable: false
  },
  {
    name: 'music CD',
    qty: 1,
    price: 14.99,
    imported: false,
    taxable: true
  },
  {
    name: 'chocolate bar',
    qty: 1,
    price: 0.85,
    imported: false,
    taxable: false
  }
]

receipt = generate_receipt_details(products)
print_receipt(products, receipt)
