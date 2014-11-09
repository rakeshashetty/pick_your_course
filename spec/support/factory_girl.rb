RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    Rails.application.load_seed
    begin
      DatabaseCleaner.start
      #FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end