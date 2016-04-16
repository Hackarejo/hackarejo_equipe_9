class Client < ActiveRecord::Base
  has_one :user, as: :userable
end
