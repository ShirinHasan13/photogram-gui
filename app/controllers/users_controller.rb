class UsersController < ApplicationController 
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({:template => "user_templates/index"})
  end

  def create
    @new_user = User.new
    @new_user.username = params.fetch("username")

    if @new_user.save
      redirect_to("/users/#{@new_user.username}")
    else
      render({ :template => "user_templates/index" })
    end
  end

  def update
    user_id = params.fetch("id")
    the_user = User.where({ :id => user_id }).at(0)
       
    the_user.username = params.fetch("username")
    the_user.save

    redirect_to("/users/#{user_id}")
  end

  def show
    # Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.at(0)
    # if @the_user == nil
    # redirect_to("/404")
    # else
    render({:template => "user_templates/show"})
    # end
  end
end
