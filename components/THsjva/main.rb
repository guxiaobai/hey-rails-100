def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

# insert_into_file 'Gemfile', "\ngem 'oj', '~> 3.13', '>= 3.13.21'", :after => '# gem "jbuilder"'
# uncomment_lines 'Gemfile', /gem\s"jbuilder"/
# uncomment_lines 'Gemfile', /gem\s"rack-cors"/

# gem 'jbuilder'
gem 'rack-cors'



run_bundle

# @TODO 动态调整内容
copy_file 'welcome_controller.rb', 'app/controllers/welcome_controller.rb'
copy_file 'index.json.jbuilder', 'app/views/welcome/index.json.jbuilder'
copy_file 'index.html.erb', 'app/views/welcome/index.html.erb'

remove_file "config/initializers/cors.rb"
copy_file "cors.rb", "config/initializers/cors.rb"

route "root 'welcome#index'"