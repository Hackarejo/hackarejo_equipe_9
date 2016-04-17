class Shop < ActiveRecord::Base
  has_many :visits
  has_many :credits
  has_many :wirelesses

  scope :with_visit_by, -> (client_id) {
    joins(:visits).where(visits: { client_id: client_id })
  }

  #
  # Points for a given client
  #
  def credits_for(client)
    credits.where(client_id: client.id).sum(:quantity)
  end

  #
  # Register a visit by a given client
  #
  def register_visit_by(client)
    Visit.create(shop_id: self.id, client_id: client.id)
    Credit.create(shop_id: self.id, client_id: client.id, quantity: 1)
  end
end
