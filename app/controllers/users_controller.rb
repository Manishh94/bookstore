class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.order(id: :desc)
    if query.present?
      filter_users
    end
    @users = @users.paginate(page: params[:page], per_page: 30)
  end

  def filter_users
    @users = @users.where("email like '%#{query[:email].to_s}%' ") if query[:email].present?
    @users = @users.with_role(query[:role]) if query[:role].present?
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
    else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(update_user_params)
        if params.dig(:user, :role).present?
          @user.roles.destroy_all
          @user.roles << Role.find(params[:user][:role])
        end
        format.html { redirect_to users_url, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    
  def user_params
    params.require(:user).permit(
      :email, :name
    )
  end


  def update_user_params
    params.require(:user).permit(
      :name
    )
  end

    def query
      params[:query]
    end
end
