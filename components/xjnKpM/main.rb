def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem 'rails-i18n', '~> 8.0', '>= 8.0.2'

run_bundle

copy_file 'locale.rb', 'config/initializers/locale.rb'
remove_file 'config/locales/en.yml'
directory 'locales', 'config/locales'


# enumerize
append_to_file 'config/locales/en.yml' do
  <<-EOS.strip_heredoc.indent(2)
    enumerize:
  EOS
end
append_to_file 'config/locales/zh-CN.yml' do
  <<-EOS.strip_heredoc.indent(2)
    enumerize:
  EOS
end
