class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "Book was successfully created."
       redirect_to @book
    else
      flash.now[:alert] = 'Do it again.'
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book
    else
      flash.now[:alert] = 'Do it again.'
      render("books")
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(@book)
  end

  def top
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end


