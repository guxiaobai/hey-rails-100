gem 'devise', '~> 4.9', '>= 4.9.4'

run_bundle


generate('devise:install')
generate('devise', 'admin')



# seeds


# before_action :authenticate_admin!