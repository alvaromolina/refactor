# DateCalculator
# Class that converts days to years
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
    # Anso bsiisiesto solo cada 4 anos y 100 , pero no cada 40000
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
 
 
