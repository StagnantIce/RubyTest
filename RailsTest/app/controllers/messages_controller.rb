class MessagesController < ApplicationController

def index
mess = Messages.new
mess.message = params[:message]
mess.user_id = params[:user_id].to_i
mess.autor_id = session[:user_id].to_i
mess.save
  redirect_to   detail_path + "/#{params[:user_id]}"
end
  
  
  

  
end
