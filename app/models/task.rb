class Task < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title
  validates :memo, presence: true, length: {minimum: 10, maximum: 30}
  validates :status, presence: true
  enum status: {draft: 0, published: 1, archieved: 2}
end
