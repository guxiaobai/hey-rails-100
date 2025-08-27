
say "Install Bootstrap with Bootstrap Icons"
run "yarn add bootstrap bootstrap-icons"


append_to_file 'config/initializers/assets.rb' do
  <<-EOS.strip_heredoc
  
    # BootStrap
    Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap/dist/css")
    Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap/dist/js")
    Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap-icons/font")
  EOS
end


insert_into_file 'app/views/layouts/application.html.erb', before: '</head>' do
  <<-EOS.strip_heredoc
  <%= stylesheet_link_tag 'bootstrap.min' %>
  EOS
end

insert_into_file 'app/views/layouts/application.html.erb', before: '</body>' do
  <<-EOS.strip_heredoc
  <%= javascript_include_tag "bootstrap.bundle.min" %>
  EOS
end