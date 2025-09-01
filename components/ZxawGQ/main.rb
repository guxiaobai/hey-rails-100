insert_into_file 'Gemfile', :after => /:development, :test do/ do
  <<-EOS.strip_heredoc.indent(2)
  
    gem 'dotenv', '~> 3.1', '>= 3.1.8'
  EOS
end

run_bundle

append_to_file '.gitignore' do
  <<-EOS.strip_heredoc
    # dotenv
    !.env.template
  EOS
end

create_file '.env.template'
run 'cp .env.template .env.development.local'

git add: "."
git commit: %Q<-m 'Environment Manage'>