class ApplicationController < ActionController::Base
  protect_from_forgery
 before_filter :initialize_search

  protected
  def initialize_search
    @q = Cheerup.search(params[:q])
    @result = @q.result
    #raise
  end
end