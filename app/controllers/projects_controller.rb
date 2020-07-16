class ProjectsController < ApplicationController

    # ------------------ CREATE ------------------

    # user can create a new project
    get '/projects/new' do
        redirect_if_not_logged_in
        erb :'/projects/new'
    end

    post '/projects' do
        if logged_in?
            if params[:title].empty? || params[:image_url].empty? || params[:information].empty? # check if i could use validate?
                flash[:errors] = "ERROR: Column(s) cannot be empty, please enter information."
                redirect to '/projects/new'
            else
                @project = Project.new(title: params[:title], image_url: params[:image_url], information: params[:information])
                @project.user_id = current_user.id
                @project.save
                flash[:message] = "You have successfully created your project."
                redirect "/projects/#{@project.id}"
            end
        else
            redirect '/login'
        end
    end

    # ------------------ READ ------------------

    # show all projects
    get '/projects' do
        # allow volunteers to see projects (even they are not logged_in yet)
        @projects = Project.all
        erb :'/projects/all_projects'
    end

    # show single project
    get '/projects/:id' do
        find_project
        erb :'/projects/show_project'
    end

    # ------------------ UPDATE ------------------

    get '/projects/:id/edit' do
        redirect_if_not_logged_in
        find_project
        if authorized_user?(@project)
            erb :'projects/edit_project'
        else
            flash[:errors] = "ERROR: NOT authorized to edit this project."
            redirect "/projects/#{@project.id}"
        end
    end

    patch '/projects/:id' do
        find_project
        if params[:title].empty? || params[:image_url].empty? || params[:information].empty?
            flash[:errors] = "ERROR: Edit creation failure, please do not submit blank column(s)."
            redirect "/projects/#{@project.id}/edit"
        else
            @project.update(title: params[:title], image_url: params[:image_url], information: params[:information])
            flash[:message] = "You have successfully updated your project."
            redirect "/projects/#{@project.id}"
        end
    end

    # ------------------ DELETE ------------------

    delete '/projects/:id/delete' do
        redirect_if_not_logged_in
        find_project
        if authorized_user?(@project)
            @project.destroy
            flash[:message] = "You have successfully deleted your project."
            redirect '/' # direct them back to their profile
        else
            flash[:errors] = "ERROR: NOT authorized to delete this project."
            redirect "/projects/#{@project.id}"
        end
    end
end