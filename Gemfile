source "https://rubygems.org"
ruby "2.3.1" # this should match `.ruby-version` and doc/setup.md
gem "rails", "5.2.4.2"

gem "active_model_serializers", ">= 0.9.4"
gem "activeadmin", git: "https://github.com/activeadmin/activeadmin.git"
gem "activeadmin_hstore_editor", ">= 0.0.5"
gem "acts_as_list", ">= 0.7.2"
gem "acts-as-taggable-on", "~> 3.5", ">= 3.5.0"
gem "ahoy_matey", "~> 1.4.0"
gem "ar_outer_joins", ">= 0.2.0"
gem "autoprefixer-rails", ">= 6.3.1"
gem "awesome_print"
gem "aws-sdk", "~> 1.66.0"
gem "bootstrap-sass", ">= 3.3.6"
gem "browser-timezone-rails", ">= 0.0.8"
gem "blazer", ">= 1.1.0"
gem "climate_control", ">= 0.0.3"
gem "clockwork", ">= 1.2.0", require: false
gem "daemons" # for delayed_job
gem "delayed_job_active_record", ">= 4.1.0"
gem "doorkeeper", ">= 3.1.0"
gem "dotenv-rails", "2.2.2"
gem "draper", ">= 2.1.0"
gem "elasticsearch-dsl"
gem "elasticsearch-model", ">= 0.1.8"
gem "elasticsearch-rails"
gem "elasticsearch-rails-ha", "~> 1.0.7"
gem "email_reply_parser"
gem "factory_girl_rails", ">= 4.6.0"
gem "faker"
gem "font-awesome-sass"
gem "foreman", require: false
gem "has_secure_token", ">= 1.0.0"
gem "haml"
gem "hashdiff"
gem "html_pipeline_rails", ">= 0.1.0"
gem "jquery-rails", ">= 4.1.0"
gem "jquery-turbolinks", ">= 2.1.0"
gem "kaminari", ">= 0.16.3"
gem "kaminari-bootstrap", "~> 3.0.1"
gem "mandrill-rails", ">= 1.4.1"
gem "newrelic_rpm"
gem "omniauth-myusa"
gem "paper_trail", "~> 4.1.0"
gem "paperclip", "4.3.6"
gem "peek", ">= 0.1.10"
gem "peek-delayed_job", ">= 0.1.1"
gem "peek-performance_bar", ">= 1.2.0"
gem "peek-pg", ">= 1.1.0"
gem "pg"
gem "pry-rails"
gem "pundit", ">= 1.1.0" # Interface for Pundit::NotAuthorizedError changed in this version
gem "rack-cors", require: "rack/cors"
gem "redcarpet"
gem "roadie-rails", ">= 1.3.0"
gem "sass-rails", ">= 5.0.5"
gem "simple_form", ">= 4.0.0"
gem "simple_form_object", ">= 0.0.8"
gem "sprockets-rails", ">= 2.3.3", "< 3" # https://github.com/jfirebaugh/konacha/issues/216
gem "turbolinks", ">= 2.5.3"
gem "uglifier", ">= 2.7.2"
gem "validates_email_format_of"
gem "workflow"
gem "actionmailer-text", ">= 0.1.1"
gem "remotipart"

group :development, :production do
  gem "puma"
end

group :test, :development do
  gem "bullet", ">= 5.0.0", require: false # use BULLET_ENABLED=true
  gem "database_cleaner"
  gem "konacha", ">= 4.0.0"
  gem "pry-byebug"
  gem "rspec-rails", ">= 3.5.0"
  gem "rack_session_access"
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
  gem "capybara"
  gem "codeclimate-test-reporter", ">= 0.4.8"
  gem "elasticsearch-extensions"
  gem "fivemat"
  gem "fuubar"
  gem "poltergeist"
  gem "rspec_junit_formatter"
  gem "shoulda-matchers", ">= 3.0.1"
  gem "simplecov", ">= 0.12.0"
  gem "site_prism"
  gem "test_after_commit", ">= 1.0.0"
  gem "timecop"
  gem "webmock", require: false
  gem "zonebie"
end

group :production do
  gem "rails_12factor"
end
