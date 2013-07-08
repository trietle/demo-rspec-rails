require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  #require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.include FactoryGirl::Syntax::Methods
    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
      #seed data
      #load "#{Rails.root}/db/seeds.rb"
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  begin
    require 'simplecov'
    SimpleCov.start do
      add_filter 'spec/spec_helper'
      add_filter '/test/'
      add_filter '/config/'

      add_group 'Controllers', 'app/controllers'
      add_group 'Models', 'app/models'
      #add_group 'Helpers', 'app/helpers'
      add_group 'Libraries', 'lib'
    end
    # SimpleCov.at_exit do
    #   SimpleCov.result.format!
    # end
  rescue Exception => ex
  end
  load "#{Rails.root}/config/routes.rb"
  #Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
end

