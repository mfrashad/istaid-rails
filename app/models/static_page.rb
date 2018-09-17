class StaticPage < ActiveRecord::Base
  validates :body, presence: true
end
