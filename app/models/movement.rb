class Movement < ApplicationRecord
  belongs_to :enterprise

  validates :name, :description, :issue_date, :net, :total_iva, :countable_type, presence: true
  before_validation :calculate_amount

  private

  def calculate_amount
    self.amount = total_iva + net if total_iva && net
    errors.add(:total_iva, "debe ser 0 o mayor") unless total_iva
    errors.add(:net, "debe existir") unless net
  end
end
