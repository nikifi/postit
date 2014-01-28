class Comment < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  belongs_to :post, foreign_key: :post_id
  has_many :votes, as: :voteable
  validates :body, presence: true

  def total_votes
    self.up_votes - self.down_votes 
  end

  def up_votes
    self.votes.where(vote: true).size

  end

  def down_votes
    self.votes.where(vote: false).size
  end
end