RSpec.configure do |config|
  config.include Warden::Test::Helpers, :warden
  config.before :suite, :warden do
    Warden.test_mode!
  end
  config.after :each, :warden do
    Warden.test_reset!
  end
end
