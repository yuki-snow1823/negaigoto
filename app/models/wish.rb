# frozen_string_literal: true

class Wish < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_name, presence: true, length: { maximum: 20 }

  validate :remind_at_cannot_be_in_the_past

  def remind_at_cannot_be_in_the_past
    return unless remind_at.present? && remind_at < DateTime.now

    errors.add(:remind_at, '過去にリマインダーを設定することはできません')
  end
end
