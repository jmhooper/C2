source "https://rubygems.org"
ruby "2.3.1" # this should match `.ruby-version` and doc/setup.md
gem "rails", "5.0.0"

gem "active_model_serializers"
gem "activeadmin", git: "https://github.com/activeadmin/activeadmin.git"
gem "activeadmin_hstore_editor", ">= 0.0.5"
gem "acts_as_list"
gem "acts-as-taggable-on", "~> 3.4"
gem "ahoy_matey", "~> 1.4.0"
gem "ar_outer_joins"
gem "autoprefixer-rails"
gem "awesome_print"
gem "aws-sdk", "~> 1.66.0"
gem "bootstrap-sass"
gem "browser-timezone-rails", ">= 0.0.8"
gem "blazer", ">= 1.1.0"
gem "climate_control"
gem "clockwork", require: false
gem "daemons" # for delayed_job
gem "delayed_job_active_record"
gem "doorkeeper", ">= 3.1.0"
gem "dotenv-rails", ">= 2.1.0", require: "dotenv/rails-now"
gem "draper", ">= 2.1.0"
gem "elasticsearch-dsl"
gem "elasticsearch-model"
gem "elasticsearch-rails"
gem "elasticsearch-rails-ha", "~> 1.0.5"
gem "email_reply_parser"
gem "factory_girl_rails", ">= 4.6.0"
gem "faker"
gem "font-awesome-sass"
gem "foreman", require: false
gem "has_secure_token"
gem "haml"
gem "hashdiff"
gem "html_pipeline_rails"
gem "jquery-rails", ">= 4.4.0"
gem "jquery-turbolinks", ">= 2.1.0"
gem "kaminari", ">= 0.16.3"
gem "kaminari-bootstrap", "~> 3.0.1"
gem "mandrill-rails"
gem "newrelic_rpm"
gem "omniauth-myusa", ">= 0.0.4"
gem "paper_trail", "~> 4.1.0"
gem "paperclip", "4.3.6"
gem "peek", ">= 0.1.10"
gem "peek-delayed_job", ">= 0.1.1"
gem "peek-performance_bar", ">= 1.2.0"
gem "peek-pg", ">= 1.1.0"
gem "pg"
gem "pry-rails"
gem "pundit", ">= 1.0.0" # Interface for Pundit::NotAuthorizedError changed in this version
gem "rack-cors", require: "rack/cors"
gem "redcarpet"
gem "roadie-rails", ">= 1.1.1"
gem "sass-rails", ">= 5.0.5"
gem "simple_form", ">= 3.2.1"
gem "simple_form_object"
gem "sprockets-rails", ">= 2.3.3", "< 3" # https://github.com/jfirebaugh/konacha/issues/216
gem "turbolinks", ">= 2.5.3"
gem "uglifier"
gem "validates_email_format_of"
gem "workflow"
gem "actionmailer-text", ">= 0.1.1"
gem "remotipart"

group :development, :production do
  gem "puma"
end

group :test, :development do
  gem "bullet", require: false # use BULLET_ENABLED=true
  gem "database_cleaner"
  gem "konacha", ">= 4.0.0"
  gem "pry-byebug"
  gem "rspec-rails", ">= 3.5.0"
  gem "rack_session_access", ">= 0.1.1"
end

group :development do
  gem "guard-rspec", require: false
  gem "guard-shell", require: false
  gem "railroady"
  gem "letter_opener"
  gem "letter_opener_web", ">= 1.3.0"
  gem "quiet_assets", ">= 1.1.0"
  gem "spring"
  gem "spring-commands-rspec"
end

group :test do
  gem "addressable"
  gem "capybara", ">= 2.6.2"
  gem "codeclimate-test-reporter"
  gem "elasticsearch-extensions"
  gem "fivemat"
  gem "fuubar"
  gem "poltergeist", ">= 1.9.0"
  gem "rspec_junit_formatter"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "site_prism", ">= 2.8"
  gem "test_after_commit"
  gem "timecop"
  gem "webmock", require: false
  gem "zonebie"
end

group :production do
  gem "rails_12factor"
end
