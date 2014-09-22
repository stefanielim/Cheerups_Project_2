class UsersController < ApplicationController

  before_filter :authenticate_user! , except: :create_test_users_data

  def create_test_users_data
    5.times do
      User.new.create_test_users
    end
    users = User.all
    users.each do |user|
      user.create_test_cheerups_data
    end
    redirect_to "users#index"
  end


  def index
    @users = User.all
    respond_to do |format|
      format.html 
      format.json { render json: @users }
    end
  end

  def show
    # if id = 'create_test_user_data'
    #   50.times do
    #     User.new.create_test_users
    #   end
    # else
    @user = User.find(params[:id])
    # end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy

    @user = User.find(params[:id])
    if @user.can_destroy?
      @user.destroy
    else
      flash[:notice] = 'Can Not delete the admin user.' 
    end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  

end
