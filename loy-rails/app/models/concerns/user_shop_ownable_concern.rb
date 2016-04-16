module UserShopOwnableConcern
  extend ActiveSupport::Concern

  included do
    scope :from_user_shop, -> (user) {
      where(user_shop_id: user.userable.shop_id)
    }
  end
end
