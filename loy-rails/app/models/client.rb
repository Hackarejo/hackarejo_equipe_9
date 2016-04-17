class Client < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :visits
  has_many :credits

  delegate :name, :name=,
    to: :user

  scope :with_visit_at, -> (shop_id) {
    joins(:visits).where(visits: { shop_id: shop_id })
  }
end
