require_relative '../store'

input_1 = {
  products: [
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
}


input_2 = {
  products: [
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
}

input_3 = {
  products: [
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
}

describe 'calculate_taxes' do
  context "input 1" do
    it { expect(calculate_taxes(input_1[:products][0])).to be(24.98) }

    it { expect(calculate_taxes(input_1[:products][1])).to be(16.49) }

    it { expect(calculate_taxes(input_1[:products][2])).to be(0.85) }
  end

  context 'input 2' do
    it { expect(calculate_taxes(input_2[:products][0])).to be(10.50) }

    it { expect(calculate_taxes(input_2[:products][1])).to be(54.65) }
  end

  context 'input 3' do
    it { expect(calculate_taxes(input_3[:products][0])).to be(32.19) }

    it { expect(calculate_taxes(input_3[:products][1])).to be(20.89) }

    it { expect(calculate_taxes(input_3[:products][2])).to be(9.75) }

    it { expect(calculate_taxes(input_3[:products][3])).to be(35.55) }
  end
end