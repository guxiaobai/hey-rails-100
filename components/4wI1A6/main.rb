def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

gem 'devise', '~> 4.9', '>= 4.9.4'

run_bundle


generate('devise:install')
generate('devise', 'user')


# seeds
append_to_file 'db/seeds.rb' do
  <<-EOS.strip_heredoc
  Admin.create(email: 'os@qq.com', password: '000000')
  EOS
end

# 路由定制

# devise_for :admins, only: [:sessions]

# namespace :admin do
# end

# 未登陆模版
# copy_file 'session.html.erb', 'app/views/layouts/session.html.erb'


## 后台首页




# before_action :authenticate_admin!


# rails_command("db:migrate")
# rails_command("db:seeds")