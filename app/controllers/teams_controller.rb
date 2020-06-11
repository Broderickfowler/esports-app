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

    delete '/teams/:id/delete' do
        if logged_in?
            @team = Team.find_by_id(params[:id])
        if @team && @team.user == current_user
            @team.delete
        end
            redirect '/team'
        else
            redirect "/login"
    end
end
end

#<a href="/teams/<%=@team.id%>/edit">Edit Team </a>