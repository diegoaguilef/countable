class Enterprise < ApplicationRecord
  has_many :movements
  belongs_to :user
  
  def incomes
    movements.where(countable_type: 'income')
  end
  
  def costs
    movements.where(countable_type: 'cost')
  end
  
  def global
    movements.sum(:amount) - costs.sum(:amount)
  end
  
  def monthly_countability(countable_type)
    movements.where(
      countable_type: countable_type, created_at: Date.today.beginning_of_month..Date.today.end_of_month
    ).sum(:amount)
  end
  
  def monthly_global
    movements.where(
      countable_type: :income, created_at: Date.today.beginning_of_month..Date.today.end_of_month
    ).sum(:amount) -
      movements.where(
        countable_type: :cost, created_at: Date.today.beginning_of_month..Date.today.end_of_month
      ).sum(:amount)
  end
  
  def monthly_iva
    movements.where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum(:total_iva)
  end
end
