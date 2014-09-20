class CheerupsController < ApplicationController

  def index
    @cheerups = Cheerup.all

    respond_to do |format|
      format.html 
      format.json { render json: @cheerups }
    end
  end

  def show
    @cheerup = Cheerup.find(params[:id])
    
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
    @cheerup.time_posted = Time.now

    respond_to do |format|
      if @cheerup.save
        format.html { redirect_to @cheerups, notice: 'Cheerup was successfully created.' }
        format.json { render json: @cheerup, status: :created, location: @cheerup }
      else
        format.html { render action: "new" }
        format.json { render json: @cheerup.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
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

end
