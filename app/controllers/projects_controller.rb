class ProjectsController < ApplicationController

    # ------------------ CREATE ------------------

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
                redirect "/projects/#{@project.id}"
            end
        else
            redirect '/login'
        end
    end

    # ------------------ READ ------------------

    # show all projects
    get '/projects' do
        # redirect_if_not_logged_in # allow volunteers to see projects (even they are not logged_in yet)
        @projects = Project.all
        erb :'/projects/all_projects'
    end

    # show single project
    get '/projects/:id' do
        redirect_if_not_logged_in
        find_project
        erb :'/projects/show_project'
    end

    # ------------------ UPDATE ------------------

    get '/projects/:id/edit' do #!!!! CHECK THIS, THIS BROKE!
        redirect_if_not_logged_in
        find_project
        if authorized_user?(@project)
            erb :'projects/edit_project'
        else
            puts "ERROR: NOT Authorized to edit this project, you are not the user" # change to flash later
            redirect "/projects/#{@project.id}"
        end
    end

    patch '/projects/:id' do
        find_project
        if params[:title].empty? || params[:image_url].empty? || params[:information].empty?
            puts "ERROR: Edit creation failure, please do not submit blank columns" # change to flash
            redirect "/projects/#{@project.id}/edit"
        else
            @project.update(title: params[:title], image_url: params[:image_url], information: params[:information])
            redirect "/projects/#{@project.id}"
        end
    end

    # ------------------ DELETE ------------------

    delete '/projects/:id/delete' do
        redirect_if_not_logged_in
        find_project
        if authorized_user?(@project)
            @project.destroy
            redirect '/projects'
        else
            puts "ERROR: Not authorized to edit others' projects!"
            redirect "/projects/#{@project.id}"
        end
    end
end