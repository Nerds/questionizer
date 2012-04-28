class Question < ActiveRecord::Base
  attr_accessible :a1, :a2, :a3, :a4, :category, :creator, :creator_github, :creator_twitter, :nerd_level, :right_answer, :sub_category, :text, :user_id, :accepted_at, :rejected_at
  belongs_to :user
  validates_presence_of :a1, :a2, :a3, :a4, :category, :creator, :creator_github, :nerd_level, :right_answer, :sub_category, :text, :user_id
end
