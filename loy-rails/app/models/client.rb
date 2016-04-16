class Client < ActiveRecord::Base
  has_one :user, as: :userable
  has_many :visits
  has_many :credits
end
