class Calculator
  def add(a, b)
    a + b
  end

  def factorial(n)
    if n <= 0
      1
    else
      #n * factorial(n - 1)
      (1..n).reduce(:*)
    end
  end
end

describe Calculator do
  describe "#add" do
    it "adds two numbers" do
      calculator = Calculator.new

      expect(calculator.add(7, 8)).to eq(15)
    end
  end

  describe "#factorial" do
    it "returns 1 when given 0 (0! = 1)" do
      calc = Calculator.new

      expect(calc.factorial(0)).to eq(1)
    end

    it "returns 1 when given 1 (1! = 1)" do
      calc = Calculator.new

      expect(calc.factorial(1)).to eq(1)
    end

    it "returns 120 when give 5 (5! = 120)" do
      calc = Calculator.new

      expect(calc.factorial(5)).to eq(120)
    end
  end
end
