require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enables the sessions hash
    enable :sessions
    # set a session secret for an extra layer of security
    set :session_secret, "secret_session"
    # if we are using Sinatra::Base style, we need to register this extension
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "users/#{current_user.id}"
    else
      erb :welcome
    end
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

    def redirect_if_not_logged_in
      if !logged_in?
        puts "ERROR" # change to flash later
        redirect '/login'
      end
    end

    def authorized_user?(project)
      project.user_id == current_user.id
    end

    def find_project
      @project = Project.find(params[:id])
    end
  end
end
