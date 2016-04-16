class Manager < ActiveRecord::Base
  belongs_to :shop
  has_one :user, as: :userable
end
