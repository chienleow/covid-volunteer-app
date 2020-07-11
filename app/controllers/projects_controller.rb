class ProjectsController < ApplicationController

    # CREATE

    # user can create a new project
    get '/projects/new' do
        redirect_if_not_logged_in
        erb :'/projects/new'
    end

    post '/projects' do
        if logged_in?
            if params[:title].empty? || params[:image_url].empty? || params[:information].empty?
                puts "ERROR: CANNOT BE EMPTY" # change to flash later
                redirect to '/projects/new'
            else
                @project = Project.new(title: params[:title], image_url: params[:image_url], information: params[:information])
                @project.user_id = current_user.id
                @project.save
                redirect to '/projects'
            end
        else
            redirect '/login'
        end
    end





    # READ
    # UPDATE
    # DELETE

end