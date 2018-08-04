# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  email            :string
#  post_id          :integer
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 3 }
end
