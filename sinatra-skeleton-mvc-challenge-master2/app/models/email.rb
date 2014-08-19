class Email < ActiveRecord::Base
  belongs_to :user
  validates :subject, :body, uniqueness: true
end
