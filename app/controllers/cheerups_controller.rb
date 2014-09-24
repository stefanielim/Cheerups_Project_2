class CheerupsController < ApplicationController

  load_and_authorize_resource :except => [:index, :search]

  before_filter :authenticate_user!, except: [:index, :show, :search]

  def search
    @cheerup = Cheerup.new
    @cheerups = @result
    render "index"
  end

  def index
    @cheerups = Cheerup.sort_by_prominence
    @cheerup = Cheerup.new

    respond_to do |format|
      format.html 
      format.json { render json: @cheerups }
    end
  end

  def show
    @cheerup = Cheerup.find(params[:id])
    #raise
      respond_to do |format|
      format.html
      format.json { render json: @cheerup }
    end
  end

  def new
    @cheerup = Cheerup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @cheerup }
    end
  end

  def create
    @cheerup = Cheerup.new(params[:cheerup])
    @cheerup.user = current_user

    respond_to do |format|
      if @cheerup.save
        format.html { redirect_to cheerups_path, notice: 'Cheerup was successfully created.' }
        format.json { render json: @cheerup, status: :created, location: @cheerup }
      else
        format.html { render action: "new" }
        format.json { render json: @cheerup.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cheerup = Cheerup.find(params[:id])
  end

  def update
    @cheerup = Cheerup.find(params[:id])

    respond_to do |format|
      if @cheerup.update_attributes(params[:cheerup])
        format.html { redirect_to @cheerup, notice: 'Cheerup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cheerup.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

   @cheerup = Cheerup.find(params[:id])
   @cheerup.destroy

   respond_to do |format|
     format.html { redirect_to cheerups_url }
     format.json { head :no_content }
   end
 end  


  def vote
    @cheerup = Cheerup.find(params[:id])

    respond_to do |format|
      if @cheerup.user != current_user
        case params[:direction]
        when 'up'
          @cheerup.liked_by current_user
        when 'down'
          @cheerup.downvote_from current_user
        end

        @cheerup.set_prominence
        @cheerup.user.set_prominence

        format.html { redirect_to cheerups_path }
        format.json { head :no_content }
      else
        format.html { redirect_to cheerups_path, notice: "Sorry, you can't vote on your own cheerup" }
        format.json { render json: "Sorry, you can't vote on your own cheerup", status: :unprocessable_entity }
      end
    end
  end
  
end