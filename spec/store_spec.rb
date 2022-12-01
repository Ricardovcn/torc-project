require_relative '../store'

input_1 = [
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

input_2 = [
  {
    name: 'box of chocolate',
    qty: 1,
    price: 10.00,
    imported: true,
    taxable: false
  },
  {
    name: 'bottle of perfume',
    qty: 1,
    price: 47.50,
    imported: true,
    taxable: true
  }
]

input_3 = [
  {
    name: 'bottle of perfume',
    qty: 1,
    price: 27.99,
    imported: true,
    taxable: true
  },
  {
    name: 'bottle of perfume',
    qty: 1,
    price: 18.99,
    imported: false,
    taxable: true
  },
  {
    name: 'packet of headache pills',
    qty: 1,
    price: 9.75,
    imported: false,
    taxable: false
  },
  {
    name: 'boxes of chocolates',
    qty: 3,
    price: 11.25,
    imported: true,
    taxable: false
  }
]

expected_output = {
  products: [24.98, 16.49, 0.85],
  sales_taxes: 1.50,
  total: 42.32,
}

expected_output_2 = {
  products: [10.50, 54.65],
  sales_taxes: 7.65,
  total: 65.15,
}

expected_output_3 = {
  products: [32.19, 20.89, 9.75, 35.55],
  sales_taxes: 7.90,
  total: 98.38,
}


describe 'calculate_taxes' do
  context "input 1" do
    it { expect(calculate_taxes(input_1[0])).to eq({ total_price: 24.98, taxes: 0.0 }) }

    it { expect(calculate_taxes(input_1[1])).to eq({ total_price: 16.49, taxes: 1.50 }) }

    it { expect(calculate_taxes(input_1[2])).to eq({ total_price: 0.85, taxes: 0.0 }) }
  end

  context 'input 2' do
    it { expect(calculate_taxes(input_2[0])).to eq({ total_price: 10.50, taxes: 0.50 }) }

    it { expect(calculate_taxes(input_2[1])).to eq({ total_price: 54.65, taxes: 7.15 }) }
  end

  context 'input 3' do
    it { expect(calculate_taxes(input_3[0])).to eq({ total_price: 32.19, taxes: 4.20 }) }

    it { expect(calculate_taxes(input_3[1])).to eq({ total_price: 20.89, taxes: 1.90 }) }

    it { expect(calculate_taxes(input_3[2])).to eq({ total_price: 9.75, taxes: 0.0 }) }

    it { expect(calculate_taxes(input_3[3])).to eq({ total_price: 35.55, taxes: 1.80 }) }
  end
end

describe 'generate_receipt_details' do
  it { expect(generate_receipt_details(input_1)).to eq(expected_output) }

  it { expect(generate_receipt_details(input_2)).to eq(expected_output_2) }

  it { expect(generate_receipt_details(input_3)).to eq(expected_output_3) }
end
