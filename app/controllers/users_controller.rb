class UsersController < ApplicationController
    
    # render the login form
    get '/login' do
        erb :'users/login'
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
            # redirect logged_in user to user's profile
            redirect "/users/#{@user.id}"
        else
            # show an error message
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end

end