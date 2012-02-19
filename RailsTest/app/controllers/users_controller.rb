class UsersController < ApplicationController

def new
  @user = User.new
end

def list
    @all = User.find(:all, :order => "name asc")
end

def detail

   @user_detail = User.find(params[:id])
   @user_messages = Messages.find_by_sql("Select message, name, messages.created_at from messages inner join users on users.id = messages.autor_id and messages.user_id = #{params[:id]} order by messages.created_at desc")

end

def default

end

def index
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end

end