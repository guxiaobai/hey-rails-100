def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem 'rails-i18n', '~> 7.0', '>= 7.0.9'

run_bundle

copy_file 'locale.rb', 'config/initializers/locale.rb'
remove_file 'config/locales/en.yml'
directory 'locales', 'config/locales'
