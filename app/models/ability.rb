class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.access == 3
        can :manage, :all
      end
      can :manage, ExamBuilder
      can :manage, Question, :exam => {:exam_builder => {:user_id => user.id}}
      can [:new, :create], Question
    end
  end
end
