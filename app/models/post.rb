class Post < ApplicationRecord
  acts_as_taggable

  validates :title, presence: true
  validates :body, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  PER_PAGE = 9

  scope :most_recent, -> { order(published_at: :desc) }
  scope :published, -> { where(published: true) }
  scope :recent_paginated, -> (page) { most_recent.paginate(page: page, per_page: PER_PAGE) }
  scope :with_tag, -> (tag) { tagged_with(tag) if tag.present? }
  
  scope :list_for, -> (page, tag) do
    recent_paginated(page).with_tag(tag)
  end

  def should_generate_new_friendly_id?
  	title_changed?
  end

  def published_date
  	if published_at.present?
      "Published on #{published_at.strftime('%-b %-d %Y')}"
    else
      "Not published yet."
    end
  end

  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end
end
