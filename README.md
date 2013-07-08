demo-rspec-rails
===================

Run these commands to try it out.

```
bundle
rake db:setup
rails s
```

Start Spork

```
guard
```

Then, Run RSpec with spork

```
rake db:test:prepare
bundle exec rspec # run all specs
bundle exec rspec spec/features spec/models# Run only model specs, and features spec with default using selemium
```

View coverage: open up coverage/index.html in your browser and check out what you've missed so far.

Requires Ruby 1.9.2 or later to run.

