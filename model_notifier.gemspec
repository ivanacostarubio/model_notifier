# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{model_notifier}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Acosta-Rubio", "Corey Haines"]
  s.date = %q{2009-05-26}
  s.description = %q{Notifies when a model is created}
  s.email = %q{ivan@bakedweb.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "cucumber.yml",
     "features/model_notifier.feature",
     "features/step_definitions/email_steps.rb",
     "features/step_definitions/model_notifier_steps.rb",
     "features/support/env.rb",
     "lib/model_notifier.rb",
     "model_notifier.gemspec",
     "spec/lib/model_notifier_spec.rb",
     "spec/rcov.opts",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "test_rails_app/README",
     "test_rails_app/Rakefile",
     "test_rails_app/app/controllers/application.rb",
     "test_rails_app/app/helpers/application_helper.rb",
     "test_rails_app/app/models/contact_form.rb",
     "test_rails_app/app/models/foo.rb",
     "test_rails_app/app/views/model_notifier/contact_form/notification_email.erb",
     "test_rails_app/app/views/model_notifier/foo/notification_email.erb",
     "test_rails_app/config/boot.rb",
     "test_rails_app/config/database.yml",
     "test_rails_app/config/environment.rb",
     "test_rails_app/config/environments/development.rb",
     "test_rails_app/config/environments/production.rb",
     "test_rails_app/config/environments/test.rb",
     "test_rails_app/config/initializers/inflections.rb",
     "test_rails_app/config/initializers/mime_types.rb",
     "test_rails_app/config/initializers/new_rails_defaults.rb",
     "test_rails_app/config/locales/en.yml",
     "test_rails_app/config/routes.rb",
     "test_rails_app/db/migrate/20090525195411_create_foos.rb",
     "test_rails_app/db/migrate/20090525200701_create_contact_forms.rb",
     "test_rails_app/lib/tasks/cucumber.rake",
     "test_rails_app/lib/tasks/rspec.rake",
     "test_rails_app/public/404.html",
     "test_rails_app/public/422.html",
     "test_rails_app/public/500.html",
     "test_rails_app/public/dispatch.cgi",
     "test_rails_app/public/dispatch.fcgi",
     "test_rails_app/public/dispatch.rb",
     "test_rails_app/public/favicon.ico",
     "test_rails_app/public/images/rails.png",
     "test_rails_app/public/index.html",
     "test_rails_app/public/javascripts/application.js",
     "test_rails_app/public/javascripts/controls.js",
     "test_rails_app/public/javascripts/dragdrop.js",
     "test_rails_app/public/javascripts/effects.js",
     "test_rails_app/public/javascripts/prototype.js",
     "test_rails_app/public/robots.txt",
     "test_rails_app/script/about",
     "test_rails_app/script/autospec",
     "test_rails_app/script/console",
     "test_rails_app/script/cucumber",
     "test_rails_app/script/dbconsole",
     "test_rails_app/script/destroy",
     "test_rails_app/script/generate",
     "test_rails_app/script/performance/benchmarker",
     "test_rails_app/script/performance/profiler",
     "test_rails_app/script/performance/request",
     "test_rails_app/script/plugin",
     "test_rails_app/script/process/inspector",
     "test_rails_app/script/process/reaper",
     "test_rails_app/script/process/spawner",
     "test_rails_app/script/runner",
     "test_rails_app/script/server",
     "test_rails_app/script/spec",
     "test_rails_app/script/spec_server"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bakedweb/model_notifier}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{send an email when a watched model is created}
  s.test_files = [
    "spec/lib/model_notifier_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
