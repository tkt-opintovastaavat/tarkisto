class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.access == 3
        can :manage, :all
      end
      can :manage, ExamBuilder
    end
  end
end
