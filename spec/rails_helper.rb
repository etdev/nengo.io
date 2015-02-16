ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'email_spec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

Monban.test_mode!

require File.expand_path('../../config/environment', __FILE__)
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include Monban::Test::Helpers, type: feature
  #config.include EmailSpec:Matchers

  config.after :each do
    Monban.test_reset!
  end
end
