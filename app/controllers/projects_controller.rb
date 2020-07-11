class ProjectsController < ApplicationController

    # CREATE

    # user can create a new project
    get '/projects/new' do
        redirect_if_not_logged_in
        erb :'/projects/new'
    end

    post '/users/project/:id' do

    end





    # READ
    # UPDATE
    # DELETE

end