class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    if user.role=="admin"
      can :create, List
      can :update, List, :active => true, :user_id => user.id
      can :destroy, List, :active => true, :user_id => user.id
      can :read, List

      can :create, Card
      can :destroy, Card, :active => true, :user_id => user.id
      can :update, Card, :active => true, :user_id => user.id
      can :read, Card

      can :create, Comment
      can :read, Comment

      can :manage, ListUser

    else
      can :read, Card
    end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
