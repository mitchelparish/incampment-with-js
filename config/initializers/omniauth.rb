Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'f60edf739c7e19c4c69c', 'dacd93967986728228a9ffab92c761218e70d285'
end
