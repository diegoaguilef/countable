module HomeHelper
  def advance_month_percent
    Date.today.day * 100 / Date.today.end_of_month.day
  end
end