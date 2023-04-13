class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # User routes
  post '/users' do
    @user = User.create(
      name: params['name'],
      email: params['email']
    )

    @user.to_json
  end

  get '/users' do
    @users = User.all
    @users.to_json
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])

    halt 404, 'Record not found' if @user.nil?

    @user.to_json
  end

  patch '/users/:id' do
    @user = User.find_by(id: params[:id])

    halt 404, 'Record not found' if @user.nil?

    @user.update(params.slice(*User.column_names))

    @user.to_json
  end

  delete '/users/:id' do
    @user = User.find_by(id: params[:id])

    halt 404, 'Record not found' if @user.nil?

    @user.destroy

    status 204
  end

  # Author routes
  post '/authors' do
    @author = Author.create(
      name: params['name'],
      bio: params['bio']
    )

    @author.to_json
  end

  get '/authors' do
    @authors = Author.all
    @authors.to_json
  end

  get '/authors/:id' do
    @author = Author.find_by(id: params[:id])

    halt 404, 'Record not found' if @author.nil?

    @author.to_json
  end

  patch '/authors/:id' do
    @author = Author.find_by(id: params[:id])

    halt 404, 'Record not found' if @author.nil?

    @author.update(params.slice(*Author.column_names))

    @author.to_json
  end

  delete '/authors/:id' do
    @author = Author.find_by(id: params[:id])

    halt 404, 'Record not found' if @author.nil?

    @author.destroy

    status 204
  end
end
