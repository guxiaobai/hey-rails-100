## 01 - yaml

|本期版本|上期版本
|:---:|:---:
`Fri Apr 24 14:09:07 CST 2026` |

```ruby
redis_config = Rails.application.config_for(:redis)
```

----

`YAML.load_file` **不会处理 ERB**，所以像下面这样的内容：

```
production:
  url: <%= ENV['REDIS_URL'] %>
```

直接这样加载：

```
YAML.load_file(Rails.root.join("config/redis.yml"), aliases: true)
```

得到的只是字符串：

```
"<%= ENV['REDIS_URL'] %>"
```

不会替换成环境变量。

------

## 正确做法：先用 ERB 解析，再用 YAML 加载

改成这样：

```
redis_yml = ERB.new(
  File.read(Rails.root.join("config/redis.yml"))
).result

redis_config = YAML.safe_load(
  redis_yml,
  aliases: true
)[Rails.env]
```

------

## 如果你想保留 symbol 或复杂对象（一般不需要）

可以这样：

```
redis_config = YAML.safe_load(
  ERB.new(File.read(Rails.root.join("config/redis.yml"))).result,
  aliases: true,
  permitted_classes: [Symbol]
)[Rails.env]
```

------

## 推荐写法（Rails 风格）

Rails 自带了 `config_for`，它支持 ERB：

```
redis_config = Rails.application.config_for(:redis)
```

然后你的 `config/redis.yml`：

```
default: &default
  url: <%= ENV['REDIS_URL'] || "redis://127.0.0.1:6379/0" %>

development:
  <<: *default

production:
  <<: *default
```

这样 `redis_config` 会得到：

```
{ "url" => "redis://127.0.0.1:6379/0" }
```

------

## 建议

在 Rails 项目里，**优先使用**：

```
Rails.application.config_for(:redis)
```

而不是：

```
YAML.load_file
```

因为 `config_for`：

1. 支持 `<%= ENV %>`
2. 自动按 `Rails.env` 取配置
3. 更符合 Rails 配置习惯
