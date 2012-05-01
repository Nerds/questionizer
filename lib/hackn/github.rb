module Hackn
  class Github
    include HTTParty
    base_uri NerdpursuitFrontend::Application.config.github_base_uri
    format :json
    debug_output
    attr_accessor :token

    def initialize(token, author)
      @token = token
      @author = author
    end

    def sha_latest_commit
      get("/git/refs/heads/master").parsed_response.fetch("object").fetch("sha")
    end

    def sha_base_tree
      get("/git/commits/#{sha_latest_commit}").parsed_response.fetch("sha")
    end

    def create_tree(path, content)
      @sha_new_tree = post("/git/trees", 
        :body => { 
          "base_tree" => sha_base_tree, 
          "tree" => [{
            "path" => path,
            "mode" => "100644",
            "type" => "blob",
            "content" => content }] }.to_json,
        :headers => {"Authorization" => "token #{self.token}", "Content-Type" => "application/json"}
      ).parsed_response.fetch("sha")
    end

    def create_commit(tree_sha, message)
      post("/git/commits",
        :body => {
          "message" => message,
          "parents" => [sha_latest_commit],
          "tree" => tree_sha,
          "author" => {
            "name" => @author.login,
            "email" => @author.email,
            "date" => Time.now
            }
          }.to_json,
        :headers => {"Authorization" => "token #{self.token}", "Content-Type" => "application/json"}
      ).parsed_response.fetch("sha")
    end

    def point_master_to_commit(commit_sha)
      put("/git/refs/heads/master", 
        :body => { :sha => commit_sha }.to_json, 
        :headers => {"Authorization" => "token #{self.token}", "Content-Type" => "application/json"}
      ).code
    end

    protected

    def put(url, options = {})
      self.class.put(url, options)
    end

    def post(url, options = {})
      self.class.post(url, options)
    end

    def get(url, options = {})
      self.class.get(url, options)
    end
  end
end