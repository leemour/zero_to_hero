class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])

    Friendship.transaction do
      Friendship.create!(user: current_user, friend: friend)
      Friendship.create!(user: friend, friend: current_user)
    end

    redirect_to user_path(current_user)
  end

  def destroy
    friend = User.find(params[:friend_id])

    Friendship.transaction do
      Friendship.where(user: current_user, friend: friend).destroy_all
      Friendship.where(user: friend, friend: current_user).destroy_all
    end

    redirect_to user_path(current_user)
  end
end
