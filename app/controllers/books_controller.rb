class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:create] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      flash[:danger] = "Name is too short (minimum is 2 characters)"
      redirect_to "/books"
    end
  end

  def index
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      flash[:danger] = "Error message books_controller"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
