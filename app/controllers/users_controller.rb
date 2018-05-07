class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  helper_method :get_ranking
  helper_method :get_global_ranking

  def get_global_ranking
    h = Hash.new
    User.all.each do |user|
      score = 0
      user.routes.each do |route|
        score += route.score / (Check.where(route_id: route.id).count+1)
      end
      h[user.login] = score
    end
    h = h.sort_by {|_key, value| value}.reverse
    return h
  end

  def get_ranking
    h = get_global_ranking
    ranking = h.find_index{|_key, value| _key==@user.login} + 1
    return ranking
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
#    if @current_user.try(:role) != "admin"
#      flash[:error] = "Accès interdit"
#      return redirect_to request.referrer || root_path
#    end

    @user = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home
  end

  def login
  end

  def logout
    session[:user_id] = nil
    flash[:info] = "Vous êtes maintenant déconnecté"
    redirect_to "/home"
  end

  def check
    @current_user = User.where(login: params[:login], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/home"
    else
      session[:user_id] = nil
      flash[:error] = "Échec de la connexion"
      redirect_to "/login"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :role, :email, :password)
    end

end
