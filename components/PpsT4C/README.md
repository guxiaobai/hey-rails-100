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



## Ref

* [https://github.com/activerecord-hackery/ransack](https://github.com/activerecord-hackery/ransack)
* [https://activerecord-hackery.github.io/ransack/](https://activerecord-hackery.github.io/ransack/)
* [使用 Ransack 幫你完成後端搜尋與 Sorting | 五倍紅寶石・專業程式教育](https://5xruby.tw/posts/ransack-sorting)