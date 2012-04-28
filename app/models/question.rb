class Question < ActiveRecord::Base
  include HTTParty  

  attr_accessible :a1, :a2, :a3, :a4, :category, :creator, :creator_github, :creator_twitter, :nerd_level, :right_answer, :sub_category, :text, :user_id, :accepted_at, :rejected_at
  belongs_to :user
  validates_presence_of :a1, :a2, :a3, :a4, :category, :creator, :creator_github, :nerd_level, :right_answer, :sub_category, :text, :user_id

  def update_file_and_commit(path, content, message)
    gh = ::Hackn::Github.new(self.user.authorizations.find_by_provider('github').token)
    tree_sha = gh.create_tree(path, content)
    commit_sha = gh.create_commit(tree_sha, message)
    gh.point_master_to_commit(commit_sha)
  end

  def to_json
    { "question" => hashie = self.attributes.keep_if{ |attribute| %w(sub_category category nerd_level text a1 a2 a3 a4 right_answer created_at creator creator_github creator_twitter).include? attribute}}.to_json
  end
end
