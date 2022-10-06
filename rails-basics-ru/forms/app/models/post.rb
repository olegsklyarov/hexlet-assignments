class Post < ApplicationRecord
  validates :title, :body, :summary, presence: true
  validates :published, inclusion: { in: [true, false] }

  def created_formatted
    created_at.in_time_zone('Moscow').strftime('%H:%M %d.%m.%Y')
  end
end
