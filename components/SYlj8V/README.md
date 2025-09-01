# Pagy

|本期版本|上期版本 
|:---:|:---:
`Mon Oct 16 23:18:15 CST 2023` | 

> `controller`

```ruby
include Pagy::Backend
helper_method :pagy_metadata
Pagy::DEFAULT[:items] = 4
Pagy::DEFAULT[:metadata] = [:count, :page, :items, :prev, :next, :last]
```

```
 @pagy, @posts = pagy Micropost.includes(:account), page: params[:page]
```

> `jbuilder`

```ruby
json.meta pagy_metadata(@pagy)
```


## Ref

* <https://ddnexus.github.io/pagy/docs/how-to/>
* <https://github.com/kaminari/kaminari>
* <https://github.com/mislav/will_paginate>