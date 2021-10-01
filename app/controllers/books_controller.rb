class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @category = Category.find(params[:book][:category])
        @book = @category.books.create(book_params)

        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @category = Category.find(params[:book][:category])
        @book = @category.books.create(book_params)

        if @book.update(book_params)
            redirect_to books_path
        else
            render :new
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy

        redirect_to root_path
    end
    
    private
        def book_params
            params.require(:book).permit(:name, :price, :author, :editor, :description)
        end
end
