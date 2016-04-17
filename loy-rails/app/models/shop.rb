class Shop < ActiveRecord::Base
  has_many :visits
  has_many :credits

  scope :with_visit_by, -> (client_id) {
    joins(:visits).where(visits: { client_id: client_id })
  }

  #
  # Points for a given client
  #
  def credits_for(client)
    credits.where(client_id: client.id).sum(:quantity)
  end
end
