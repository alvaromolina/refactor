class DateCalculator
  def initialize(days)
    @days = days
    @year = 1980
  end
 
  def convert
    while (@days > 365) do
      if leap_year?
        add_leap_year
      else
        add_regular_year
      end
    end
    return @year
  end
 
  # extracted methods
  def leap_year?
    (@year % 400 == 0 ||
      (@year % 4 == 0 && @year % 100 != 0))
  end
 
  def add_leap_year
    if (@days > 366)
      @days -= 366
      @year += 1
    end
  end
 
  def add_regular_year
    @days -= 365
    @year += 1
  end
 
end
 
 
describe DateCalculator do
  describe 'leap years' do
    before(:each) do
      @calc = DateCalculator.new(0)
    end
    def test_leap_year(year)
      @calc.instance_variable_set('@year', year)
      @calc.leap_year?
    end
    it 'should occur every 4 years' do
      test_leap_year(2004).should be_true
    end
    it 'but not every 100th year' do
      test_leap_year(1900).should_not be_true
    end
    it 'but YES every 400th year' do
      test_leap_year(2000).should be_true
    end
  end
end