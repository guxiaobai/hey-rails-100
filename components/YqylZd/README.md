# Rails Ruby 版本管理全解析

> 从 Gemfile 到 .ruby-version，以及 Capistrano 部署中的常见坑与最佳实践



|本期版本|上期版本 
|:---:|:---:
`Tue Aug 12 14:56:22 CST 2025` | 



## 1. Rails 对 Ruby 的版本要求

> 参考官方文档：[1.2 Ruby Versions - Upgrading Ruby on Rails](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#ruby-versions)

- **Rails 8.0** 要求最低 **Ruby 3.2.0** 版本。



## 2. Ruby 版本声明的历史变化

Rails 项目中声明 Ruby 版本的方式经历了阶段性变化，关键节点总结如下：

| 时间/版本 | Rails 行为 | 说明 |
| --- | --- | --- |
| Rails ≤5.2  | 在 `Gemfile` 中添加 `ruby "x.x.x"`                           | [**Specifying a Ruby Version - Bundler**](https://bundler.io/gemfile_ruby.html#specifying-a-ruby-version) |
| Rails 5.2   | 引入 .ruby-version 文件，辅助版本管理          | 参考 [PR #30016](https://github.com/rails/rails/pull/30016) |
| Rails 7.1.5 | [`Gemfile.tt`](https://github.com/rails/rails/blob/v7.1.5/railties/lib/rails/generators/rails/app/templates/Gemfile.tt#L3) 模板仍保留 ruby 版本声明 | -                        |
| Rails ≥7.2 | [取消 Gemfile 中的 ruby 声明](https://github.com/rails/rails/commit/75d5308f81ad5e45cd05ccf1132cc780481b9c04) | 推荐由 .ruby-version 统一管理 Ruby 版本 |





## 3. `.ruby-version` 文件的作用与生成机制

> 参考：[Ruby on Rails 5.2 Release Notes](https://github.com/rails/rails/blob/f84eecec7127cff916c89a20b0eb5678fefc572c/guides/source/5_2_release_notes.md#notable-changes)

- 新建 Rails 项目时，默认会在项目根目录生成 .ruby-version，用于记录当前 Ruby 版本。
- 生成逻辑基于模板 [ruby-version.tt](https://github.com/rails/rails/blob/main/railties/lib/rails/generators/rails/app/templates/ruby-version.tt)：

```ruby
<%= ENV["RBENV_VERSION"] || ENV["rvm_ruby_string"] || "#{RUBY_ENGINE}-#{RUBY_ENGINE_VERSION}" %>
```

具体规则：
* 如果环境变量 RBENV_VERSION 或 rvm_ruby_string 存在，则 .ruby-version 写入纯版本号（如 3.3.1）。
* 否则，写入带前缀的格式（如 ruby-3.3.1），这在某些版本管理工具（如  [rbenv](https://github.com/rbenv/rbenv?tab=readme-ov-file#rbenv-shell) ）中可能导致兼容性问题。



## 4. Capistrano + rbenv 部署中的问题

使用 [`capistrano/rbenv`](https://github.com/capistrano/rbenv) 部署时，常见读取 Ruby 版本的方式是：

```ruby
set :rbenv_ruby, File.read('.ruby-version').strip
```

如果 `.ruby-version` 是 `ruby-x.y.z` 格式，rbenv 可能解析失败，导致部署报错。



## 5. ✅ 推荐最佳实践，避免部署失败

**1. 在本地开发环境优先通过 RBENV_VERSION 变量设置版本**

例如，执行：

```bash
rbenv shell 3.3.8
```

或直接导出环境变量：

```bash
export RBENV_VERSION=3.3.8
```

**2. 如果已有项目，手动修正 .ruby-version 文件**

确保其内容为纯版本号，例如：

```
3.3.8
```

