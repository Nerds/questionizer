Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, NerdpursuitFrontend::Application.config.github_key, NerdpursuitFrontend::Application.config.github_secret, :scope => "repo"
end