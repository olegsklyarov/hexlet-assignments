class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :status, inclusion: { in: ['new', 'in progress', 'done'] }
  validates :completed, inclusion: { in: [true, false] }
end
