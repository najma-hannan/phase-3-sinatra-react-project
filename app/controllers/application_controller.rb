class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # ?User routes
  post "/users" do
    @user = User.create(name: params["name"], email: params["email"])

    @user.to_json
  end

  get "/users" do
    @users = User.all
    @users.to_json
  end

  get "/users/:id" do
    @user = User.find_by(id: params[:id])

    halt 404, "Record not found" if @user.nil?

    @user.to_json
  end

  patch "/users/:id" do
    @user = User.find_by(id: params[:id])

    halt 404, "Record not found" if @user.nil?

    @user.update(params.slice(*User.column_names))

    @user.to_json
  end

  delete "/users/:id" do
    @user = User.find_by(id: params[:id])

    halt 404, "Record not found" if @user.nil?

    @user.destroy

    status 204
  end

  # ?Author routes
  post "/authors" do
    @author = Author.create(name: params["name"], bio: params["bio"])

    @author.to_json
  end

  get "/authors" do
    @authors = Author.all
    @authors.to_json
  end

  get "/authors/:id" do
    @author = Author.find_by(id: params[:id])

    halt 404, "Record not found" if @author.nil?

    @author.to_json
  end

  patch "/authors/:id" do
    @author = Author.find_by(id: params[:id])

    halt 404, "Record not found" if @author.nil?

    @author.update(params.slice(*Author.column_names))

    @author.to_json
  end

  delete "/authors/:id" do
    @author = Author.find_by(id: params[:id])

    halt 404, "Record not found" if @author.nil?

    @author.destroy

    status 204
  end

  #? Book routes
  get "/books" do
    @books = Book.all
    @books.to_json
  end

  get "/books/:id" do
    @book = Book.find_by(id: params[:id])

    halt 404, "Record not found" if @book.nil?

    @book.to_json
  end

  post "/books" do
    @book =
      Book.new(
        title: params["title"],
        description: params["description"],
        date_of_publication: params["date_of_publication"],
        price: params["price"],
        quantity: params["quantity"]
      )
    @book.author_ids = @book.save

    @book.to_json
  end

  patch "/books/:id" do
    @book = Book.find_by(id: params[:id])

    halt 404, "Record not found" if @book.nil?

    @book.update(params.slice(*Book.column_names))

    @book.author_ids = params["author_ids"] if params["author_ids"]

    @book.to_json
  end

  delete "/books/:id" do
    @book = Book.find_by(id: params[:id])

    halt 404, "Record not found" if @book.nil?

    @book.destroy

    status 204
  end

  get "/books/:id/reviews" do
    @book = Book.find_by(id: params[:id])
    halt 404, "Record not found" if @book.nil?

    @book.reviews.load

    @book.reviews.to_json
  end

  post "/books/:book_id/reviews" do
    @book = Book.find_by(id: params[:book_id])
    halt 404, "Record not found" if @book.nil?

    @review =
      @book.reviews.create(
        user_id: params["user_id"],
        comment: params["comment"],
        rating: params["rating"]
      )

    @review.to_json
  end

  delete "/books/:book_id/reviews/:review_id" do
    @book = Book.find_by(id: params[:book_id])
    halt 404, "Record not found" if @book.nil?

    @review = @book.reviews.find(params[:review_id])
    @review.destroy

    status 204
  end

  #? Order routes
  get "/users/:user_id/orders" do
    @user = User.find_by(id: params[:user_id])
    halt 404, "User not found" if @user.nil?

    @user.orders.to_json
  end

  post "/users/:user_id/orders" do
    @user = User.find_by(id: params[:user_id])
    halt 404, "User not found" if @user.nil?

    @order = @user.orders.create()

    params[:order_items].each do |item_params|
      @book = Book.find_by(id: item_params[:book_id])
      halt 422, { errors: { book_id: "Book not found" } }.to_json if @book.nil?

      @order.order_items.create(
        book: @book,
        quantity: item_params[:quantity],
        price: @book.price
      )
    end

    @order.to_json
  end

  get "/users/:user_id/orders/:order_id" do
    @order =
      Order.where(user_id: params[:user_id], id: params[:order_id]).first()
    halt 404, "Record not found" if @order.nil?

    @order.to_json
  end

  delete "/users/:user_id/orders/:order_id" do
    @order =
      Order.where(user_id: params[:user_id], id: params[:order_id]).first()
    halt 404, "Record not found" if @order.nil?

    @order.destroy

    status 204
  end
end
