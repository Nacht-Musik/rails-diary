class Diary < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 10_000 }
  # validate :proper_title_and_body

  belongs_to :category
  belongs_to :user

  private

    # def proper_title_and_body
    #   unless title.starts_with?('今日')
    #     errors.add(:title, 'は「今日」から始めて下さい')
    #   end
    #   unless body.ends_with?('。')
    #     errors.add(:body, 'は句点「。」で終了して下さい。')
    #   end
    # end
end
