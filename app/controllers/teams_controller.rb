class TeamsController < ApplicationController
    before '/teams/*' do
        authentication_required
    end
    

    get '/teams' do
        @user = current_user
        @teams = @user.teams.all
         erb :"teams/index.html"
    end

    get '/teams/new' do
        erb :"teams/new.html"
    end

    get '/teams/:id' do
        @team = current_user.teams.find(params[:id])

        erb :"teams/show.html"
    end

    post '/teams' do
        @team = Team.new
        @team.name = params[:name]
        @team.user = current_user

        if @team.save
            redirect '/teams'
        else
            erb :"teams/new.html"
        end
    end

    post '/teams/:id/players' do
        @team = current_user.teams.find(params[:id])
        @player = @team.players.build(:gamertag => params[:gamertag])
        if @player.save
            redirect "/teams/#{@team.id}"
        else
         erb :"teams/show.html"
        end
    end

    delete '/teams/:id' do
        if logged_in?
        @team = Team.find_by_id(params[:id])
        if @team.user_id == session[:user_id]
            erb :'/teams/show'
        elsif
             @team.user_id != session[:user_id]
        redirect '/teams'
        end
        else
            flash[:message] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/teams'
        end
    end
end

#<a href="/teams/<%=@team.id%>/edit">Edit Team </a>