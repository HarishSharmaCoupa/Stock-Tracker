class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search_friend
    @friends = current_user.friends
    if params[:friend].present?
        @friend = User.where('first_name like ? or last_name like ?',params[:friend],params[:friend]).first
        if @friend && (@friend != current_user)
            render 'users/my_friends'
        else
            flash[:alert] = "User with the info not Found"
            redirect_to my_friends_path
        end
    else
        flash[:alert] = 'Please enter a name to search'
        redirect_to my_friends_path
    end
  end

  def add_friend
    friend = User.find(params[:friend])
    @friendship = Friendship.create(user: current_user, friend: friend)
    flash[:notice] = "Friend #{friend.first_name} was successfully added to your Friend List"
    redirect_to my_friends_path
  end

  def remove_friend
    friend = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user.id,friend_id: friend.id).first
    friendship.destroy
    redirect_to my_friends_path
  end
end
