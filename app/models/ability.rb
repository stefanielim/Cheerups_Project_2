class Ability
  include CanCan::Ability

 def initialize(user)
  user ||= User.new
  if user.role? :admin
    can :manage, :all
    can :manage, :create_test_users_data
   else
     can :read, :all
    end
 end
end
