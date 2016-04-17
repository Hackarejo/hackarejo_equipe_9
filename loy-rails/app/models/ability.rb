class Ability
  include CanCan::Ability

  attr_accessor :user

  def initialize(user)
    return if user.blank?

    normal_user_permissions(user)
    client_user_permissions(user) if user.client?
    manager_user_permissions(user) if user.manager?

    if user.admin?
      can :manage, :all
      can :morph, User
      can :user_office, UserOffice
    else
      cannot :morph, User
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  def normal_user_permissions(user)
    can :read, User
  end

  def client_user_permissions(user)
    can :read, Shop
  end

  def manager_user_permissions(user)
    can :read, Client
  end
end
