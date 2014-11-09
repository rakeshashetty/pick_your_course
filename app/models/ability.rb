class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    alias_action :create, :read, :update, :destroy, :to => :crud
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.professor?
      can :manage, [Course,Program] , :id => user.managed_course_ids
      can :manage, Membership
      can :manage, Syllabus, :parent_id => user.managed_course_ids
      can :manage, Chapter, :syllabus => { :id => user.managed_course_ids }
      can :create, [Course, Program, Syllabus, Chapter, Membership]
      can :read, User
    elsif user.student?
      can :read, [Course, Program, Syllabus, Chapter]
      can :read, Membership, :user_id => user.id
    else
      can :read, [Course, Program, Syllabus, Chapter]
    end
    
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
