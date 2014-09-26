class Ability
  include CanCan::Ability

 # def initialize(user)
 #  user ||= User.new
 #  if user.role? :admin
 #    can :manage, :all
 #    can :manage, :create_test_users_data
 #   else
 #     can :read, :all
 #    end
 # end
  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
      can :manage, :create_test_users_data
     elsif user.role? :user
      can :read , :all
      can :create, Cheerup
      can :manage, Cheerup
      can [:destroy, :update], Cheerup, :user_id => user.id
      can [:create,:update, :destroy] , User, :id => user.id
      
     else
       can :read, :all
      end
   end

end

