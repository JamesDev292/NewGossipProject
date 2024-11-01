class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
    @cities = City.all
  end

  def create
    @user = User.new(post_params)

    if @user.save
      
      redirect_to gossips_path, notice: "Compte créé avec succès."
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:user).permit(:first_name, :last_name,:city_id, :age, :email, :password)
  end

end