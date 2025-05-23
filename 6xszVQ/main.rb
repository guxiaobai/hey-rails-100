insert_into_file 'Gemfile', :after => /:development, :test do/ do
  <<-EOS.strip_heredoc.indent(2)
  
    gem 'seedbank', '~> 0.5.0'
  EOS
end

run_bundle

create_file 'db/seeds/development/.keep'

git add: "."
git commit: %Q<-m 'Seedbank'>