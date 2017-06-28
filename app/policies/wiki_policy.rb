class WikiPolicy < ApplicationPolicy
 class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end
#standard premium admin
    #def resolve
       # wikis = []
      # if user.role == 'admin'
       #    wikis = scope.all
       #elsif user.role == 'premium'
        #    scope.all.each |wiki|
        #end
        
       #else
       #end
   
    #end
end

  def update?
    user.admin? or not record.published?
  end
end