class DateCalculator
 
  def convert(day)
    year = 1980
    while (days > 365) do
      if leap_year?(year)
        if (days > 366)
          days -= 366
          year += 1
        end
      else
        days -= 365
        year += 1
      end
    end
    return year
  end
 
  # extracted method
  def leap_year?(year)
    (year % 400 == 0 ||
      (year % 4 == 0 && year % 100 == 0))
  end
 
end
 
describe DateCalculator do
  describe 'leap years' do
    before(:each) do ; @calc = DateCalculator.new ; end
    it 'should occur every 4 years' do
      @calc.leap_year?(2004).should be_true
    end
    it 'but not every 100th year' do
      @calc.leap_year?(1900).should_not be_true
    end
    it 'but YES every 400th year' do
      @calc.leap_year?(2000).should be_true
    end
  end
end