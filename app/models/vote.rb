class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :value, inclusion: { in: [true, false] }
  validates :value, exclusion: { in: [nil] }
  validates :user_id, presence: true
  validates :voteable_id, presence: true
  validates :voteable_type, presence: true

  scope :up, ->() { where(value: true) }
  scope :down, ->() { where(value: false) }
end
