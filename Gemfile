source "https://rubygems.org"
ruby "2.3.1" # this should match `.ruby-version` and doc/setup.md
gem "rails", "6.1.7.3"

gem "active_model_serializers"
gem "activeadmin", git: "https://github.com/activeadmin/activeadmin.git"
gem "activeadmin_hstore_editor"
gem "acts_as_list"
gem "acts-as-taggable-on", "~> 4.0", ">= 4.0.0"
gem "ahoy_matey", "~> 1.4.0"
gem "ar_outer_joins"
gem "autoprefixer-rails"
gem "awesome_print"
gem "aws-sdk", "~> 1.66.0"
gem "bootstrap-sass"
gem "browser-timezone-rails"
gem "blazer"
gem "climate_control"
gem "clockwork", require: false
gem "daemons" # for delayed_job
gem "delayed_job_active_record", ">= 4.1.5"
gem "doorkeeper"
gem "dotenv-rails", ">= 2.7.6", require: "dotenv/rails-now"
gem "draper"
gem "elasticsearch-dsl"
gem "elasticsearch-model"
gem "elasticsearch-rails"
gem "elasticsearch-rails-ha", "~> 1.0.7"
gem "email_reply_parser"
gem "factory_girl_rails"
gem "faker"
gem "font-awesome-sass"
gem "foreman", require: false
gem "has_secure_token"
gem "haml"
gem "hashdiff"
gem "html_pipeline_rails"
gem "jquery-rails", ">= 4.1.1"
gem "jquery-turbolinks"
gem "kaminari"
gem "kaminari-bootstrap", "~> 3.0.1"
gem "mandrill-rails"
gem "newrelic_rpm"
gem "omniauth-myusa"
gem "paper_trail", "~> 10.3.1"
gem "paperclip", "4.3.6"
gem "peek"
gem "peek-delayed_job"
gem "peek-performance_bar"
gem "peek-pg"
gem "pg"
gem "pry-rails"
gem "pundit", ">= 1.1.0" # Interface for Pundit::NotAuthorizedError changed in this version
gem "rack-cors", require: "rack/cors"
gem "redcarpet"
gem "roadie-rails", ">= 2.2.0"
gem "sass-rails", ">= 5.0.8"
gem "simple_form", ">= 4.0.0"
gem "simple_form_object"
gem "sprockets-rails", ">= 2.3.3", "< 3" # https://github.com/jfirebaugh/konacha/issues/216
gem "turbolinks"
gem "uglifier"
gem "validates_email_format_of"
gem "workflow"
gem "actionmailer-text"
gem "remotipart"

group :development, :production do
  gem "puma"
end

group :test, :development do
  gem "bullet", require: false # use BULLET_ENABLED=true
  gem "database_cleaner"
  gem "konacha"
  gem "pry-byebug"
  gem "rspec-rails", ">= 3.5.0"
  gem "rack_session_access"
end

group :development do
  gem "guard-rspec", require: false
  gem "guard-shell", require: false
  gem "railroady"
  gem "letter_opener"
  gem "letter_opener_web"
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
end

group :test do
  gem "addressable"
  gem "capybara"
  gem "codeclimate-test-reporter"
  gem "elasticsearch-extensions"
  gem "fivemat"
  gem "fuubar"
  gem "poltergeist"
  gem "rspec_junit_formatter"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "site_prism"
  gem "test_after_commit"
  gem "timecop"
  gem "webmock", require: false
  gem "zonebie"
end

group :production do
  gem "rails_12factor"
end
