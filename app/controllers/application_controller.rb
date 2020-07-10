require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enables the sessions hash
    enable :sessions
    # set a session secret for an extra layer of security
    set :session_secret, "secret_session"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      # keeps track of the logged in user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      # returns a boolean if the user is logged in or not
      !!current_user
    end
  end

end
