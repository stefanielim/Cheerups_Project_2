class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_search

  protected
  def initialize_search
    @q = User.search(params[:q])
    @result = @q.result.includes(:cheerups)
  end
end
