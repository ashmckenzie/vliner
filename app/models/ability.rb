class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all                   # allow everyone to read everything
    can :dashboard                    # necessary if using the master branch (9/10/2011)
    if user && user.role == 'admin'
      can :manage, :all
    end
  end
end