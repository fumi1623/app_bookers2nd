class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "User infomation was successfully updated."
      redirect_to user_path(@user.id)
    else
      flash[:danger] = "Error message users_controller"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
