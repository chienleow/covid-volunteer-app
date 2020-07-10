class UsersController < ApplicationController
    
    # render the login form
    get '/login' do
        erb :'users/login'
    end

    # receive the data (params) from the login form
    post '/login' do
        # find the user
        user = User.find_by(email: params[:email]) # pull data from the params
        # authenticate the user
        if user.authenticate(params[:password]) # from has_secure_password macro
            # log them in
            # redirect logged_in user to user's profile
        else
            # show an error message
            redirect '/login'
        end
    end

end