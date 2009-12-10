class NewsfeedLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :newsfeed
end
