class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :userable, polymorphic: true, dependent: :destroy

  validates :name, presence: true
  validates :access_token, presence: true
  validates :status, presence: true

  before_validation on: :create do
    self.status = 1
    self.access_token = SecureRandom.urlsafe_base64
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

  #
  # Admin?
  #
  def admin?
    self.userable_type == "Admin"
  end

  #
  # Client?
  #
  def client?
    self.userable_type == "Client"
  end

  #
  # Manager?
  #
  def manager?
    self.userable_type == "Manager"
  end

  #
  # Clean up associations
  #
  def clean_up_associations
    case self.userable_type
    when "Client"
      self.userable.destroy
    when "Manager"
      self.userable.shop.destroy
      self.userable.destroy
    end
  end

  private

  #
  # Initialize Client
  #
  def initialize_client
    self.userable = Client.create
  end

  #
  # Initialize Manager
  #
  def initialize_manager
    manager = Manager.new
    manager.shop = Shop.create(name: "Loja do(a) #{self.name}")
    manager.save

    self.userable = manager
  end
end
