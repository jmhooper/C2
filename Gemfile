source "https://rubygems.org"
ruby "2.3.1" # this should match `.ruby-version` and doc/setup.md
gem "rails", "5.2.8.1"

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
gem "bootstrap-sass", ">= 3.4.0"
gem "browser-timezone-rails"
gem "blazer", ">= 2.6.0"
gem "climate_control"
gem "clockwork", require: false
gem "daemons" # for delayed_job
gem "delayed_job_active_record", ">= 4.1.3"
gem "doorkeeper", ">= 4.2.6"
gem "dotenv-rails", ">= 2.2.2", require: "dotenv/rails-now"
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
gem "haml", ">= 5.0.0"
gem "hashdiff"
gem "html_pipeline_rails"
gem "jquery-rails", ">= 4.4.0"
gem "jquery-turbolinks"
gem "kaminari", ">= 1.2.1"
gem "kaminari-bootstrap", "~> 3.0.1"
gem "mandrill-rails"
gem "newrelic_rpm"
gem "omniauth-myusa"
gem "paper_trail", "~> 4.1.0"
gem "paperclip", "5.2.1"
gem "peek"
gem "peek-delayed_job"
gem "peek-performance_bar"
gem "peek-pg"
gem "pg"
gem "pry-rails"
gem "pundit", ">= 1.1.0" # Interface for Pundit::NotAuthorizedError changed in this version
gem "rack-cors", ">= 1.0.5", require: "rack/cors"
gem "redcarpet", ">= 3.5.1"
gem "roadie-rails", ">= 1.3.0"
gem "sass-rails", ">= 5.0.5"
gem "simple_form", ">= 5.0.0"
gem "simple_form_object"
gem "sprockets-rails", ">= 2.3.3", "< 3" # https://github.com/jfirebaugh/konacha/issues/216
gem "turbolinks", ">= 5.0.0"
gem "uglifier"
gem "validates_email_format_of"
gem "workflow"
gem "actionmailer-text"
gem "remotipart"

group :development, :production do
  gem "puma", ">= 4.3.12"
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
  gem "addressable", ">= 2.8.0"
  gem "capybara"
  gem "codeclimate-test-reporter"
  gem "elasticsearch-extensions"
  gem "fivemat"
  gem "fuubar"
  gem "poltergeist"
  gem "rspec_junit_formatter"
  gem "shoulda-matchers"
  gem "simplecov", ">= 0.12.0"
  gem "site_prism"
  gem "test_after_commit"
  gem "timecop"
  gem "webmock", require: false
  gem "zonebie"
end

group :production do
  gem "rails_12factor"
end
