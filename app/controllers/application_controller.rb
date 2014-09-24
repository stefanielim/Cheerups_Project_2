class ApplicationController < ActionController::Base
  protect_from_forgery
 before_filter :initialize_search

 rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_path, alert: "You can't access this page"
 end
 
  protected
  def initialize_search
    @q = Cheerup.search(params[:q])
    @result = @q.result
    #raise
  end

end