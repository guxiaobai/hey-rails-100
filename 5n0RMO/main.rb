insert_into_file 'Gemfile', :after => /:development, :test do/ do
  <<-EOS.strip_heredoc.indent(2)
  
    gem 'annotate', '~> 3.2'
  EOS
end

run_bundle

generate "annotate:install"

git add: "."
git commit: %Q<-m 'Annotate'>