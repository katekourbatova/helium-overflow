class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  
  validates :value, presence: true
  validates :user_id, presence: true
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true
end
