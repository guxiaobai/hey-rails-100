run "yarn add postcss-scss"

insert_into_file 'postcss.config.js', :after => "module.exports = {\n"  do
  <<-EOS.strip_heredoc.indent(2)
    parser: 'postcss-scss',
  EOS
end


git add: "."

git commit: %Q{ -m 'web:postcss-scss' }
