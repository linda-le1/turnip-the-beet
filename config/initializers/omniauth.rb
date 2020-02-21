Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET'], scope: %w(
    user-read-email
  ).join(' ')
end
