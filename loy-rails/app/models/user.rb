class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :userable, polymorphic: true

  validates :name, presence: true

  before_create do
    self.status = 1
  end

  #
  # Initialize as a given role:
  #   - Client
  #   - Manager
  #
  def initialize_as(role)
    return if self.persisted?

    case role
    when "client" then initialize_client
    when "manager"  then initialize_manager
    end
  end

  private

  #
  # Initialize Client
  #
  def initialize_client
    self.userable = Client.create!
  end

  #
  # Initialize Manager
  #
  def initialize_manager
    manager = Manager.create!
    manager.shop = Shop.create!(name: "Loja do(a) #{self.name}")

    self.userable = manager
  end
end
