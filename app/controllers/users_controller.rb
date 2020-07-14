class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end
    
    # render the login form
    get '/login' do
        erb :'/users/login'
    end

    # receive the data (params) from the login form
    post '/login' do
        # find the user
        @user = User.find_by(email: params[:email]) # pull data from the params
        # authenticate the user
        if @user && @user.authenticate(params[:password]) # .authenticate from has_secure_password macro
            # 'if user' make sure user can be found first then authenticate them
            # creating a 'key/value pair' in the session hash using the user's id to log them in
            session[:user_id] = @user.id
            flash[:message] = "Welcome back to the volunteer app, #{@user.name}."
            # redirect logged_in user to user's profile
            redirect "/users/#{@user.id}"
        else
            flash[:errors] = "ERROR: Wrong credentials, please try again."
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show_user'
    end

    get '/logout' do
        session.clear
        flash[:message] = "Thank you for using the volunteer app, please come back again."
        redirect '/'
    end

end