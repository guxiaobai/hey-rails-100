# Ransack


|本期版本|上期版本
|:---:|:---:
`Mon Sep 19 17:08:31 CST 2022` |


## 排序

```
a[s]: name asc
```

```
q[s][]: name asc
q[s][]: age desc
```

```
scope :sort_by_reverse_name_asc, lambda { order("age ASC") }
q[s]: reverse_name asc
```



## **Rails 7/8 + Ransack 新版本** 的安全机制



```ruby
# 允许 Ransack 搜索的字段
  def self.ransackable_attributes(auth_object = nil)
    %w[id code status created_at updated_at]
  end

  # 如果你允许关联搜索（比如 belongs_to :user）
  def self.ransackable_associations(auth_object = nil)
    %w[user]  # 没有就返回 []
  end
```



## Ref

* [https://github.com/activerecord-hackery/ransack](https://github.com/activerecord-hackery/ransack)
* [https://activerecord-hackery.github.io/ransack/](https://activerecord-hackery.github.io/ransack/)
* [使用 Ransack 幫你完成後端搜尋與 Sorting | 五倍紅寶石・專業程式教育](https://5xruby.tw/posts/ransack-sorting)