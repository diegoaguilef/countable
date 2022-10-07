class User < ApplicationRecord
  has_many :enterprises
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def global_countability
    {
      incomes: global_countable(:income),
      costs: global_countable(:cost),
      global: global_countable(:income) - global_countable(:cost),
      iva: global_iva
    }
  end

  private

  def global_countable(countable_type)
    enterprises.joins(:movements).where(movements: { countable_type: countable_type }).sum(:amount)
  end

  def global_iva
    enterprises.joins(:movements).sum(:total_iva)
  end
end
