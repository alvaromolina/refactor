class DateCalculator
 
  def convert(day)
    year = 1980
    while (days > 365) do
      if (year % 400 == 0 ||
          (year % 4 == 0 && year % 100 == 0))
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
 
end