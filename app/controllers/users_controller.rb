class UsersController < ApplicationController

   get '/signup' do
    if logged_in?
        flash[:message] = "You were already logged in. Here are your reviews"
        redirect '/teams'
    else
       erb :'users/new.html'
    end
   end 

   post '/users' do
       @user = User.new
       @user.email = params[:email]
       @user.password = params[:password]

       if @user.save
        redirect '/'
       else
        erb :'users/new.html'
       end
   end

   get '/login' do 
    if logged_in?
        flash[:message] = "You were already logged in"
        redirect '/teams'
    else

    erb :'users/login.html'
    end
   end

   post '/login' do
    @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/'
        else
            erb :'users/login.html'
        end
   end

   get '/logout' do
    if logged_in?
       session.clear
       flas[:message] = "You have been logged out"
       redirect :'users/login.html'
    else
       redirect '/'
    end
   end
end
