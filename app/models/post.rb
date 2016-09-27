class Post < ActiveRecord::Base
  scope :most_recent_first, -> { order(:created_at => :desc) }
end
