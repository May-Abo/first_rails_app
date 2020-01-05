class Link < ActiveRecord::Base

  validates :url, presence:true, length: {in: 3..255, too_long: "too long", too_short: "too short"}, on: :create, format: URI::regexp(%w[http https])
  validates :slug, uniqueness: true, length: {in: 3..255, too_long: "too long, maximum %{count} characters", too_short: "too short, minimum %{count} characters"}, on: :create
  
  # def short
  #   Rails.application.routes.url_helpers.short_url(slug: self.slug)
  # end
end