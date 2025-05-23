gem 'slim', '~> 5.2', '>= 5.2.1'

run_bundle

application 'Slim::Engine.options[:pretty] = true'

git add: "."

git commit: %Q{ -m 'web:slim' }