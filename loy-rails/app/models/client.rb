class Client < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :visits
  has_many :credits

  delegate :name, :name=,
    to: :user

  scope :with_visit_at, -> (shop_id) {
    joins(:visits).where(visits: { shop_id: shop_id })
  }

  #
  # Visits at a given shop
  #
  def visits_at(shop)
    visits.where(shop_id: shop.id)
  end

  #
  # Credits for a given shop
  #
  def credits_at(shop)
    credits.where(shop_id: shop.id).sum(:quantity)
  end
end
