class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :confirmable,
    :lockable,
    :trackable,
    :jwt_authenticatable#,
    # jwt_revocation_strategy: API::JWTBlacklist

  has_many :articles, inverse_of: :author
  has_many :comments, inverse_of: :author

  def has_friend?(friend)
    return true if Friendship.exists?(friend_id: friend.id, user_id: self.id)
    false
  end
end
