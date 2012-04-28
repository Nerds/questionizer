Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '4c2c862ba92d48bebff0', 'deefd5fd1f93f95c9941007550ddd1d0557db5f8'
end