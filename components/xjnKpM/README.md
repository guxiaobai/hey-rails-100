# Rails Locale Data Repository


```ruby
# To use the locales, use `I18n.t`:
I18n.t "hello"

# In views, this is aliased to just `t`:
<%= t("hello") %>

# To use a different locale, set it with `I18n.locale`:
I18n.locale = :es
```


---

```ruby
Model.model_name.human
Model.human_attribute_name(attribute)
```

---


```ruby
translate # Lookup text translations
localize  # Localize Date and Time objects to local formats
```

```ruby
I18n.t "store.title"
I18n.l Time.now
```

```ruby
load_path                 # Announce your custom translation files
locale                    # Get and set the current locale
default_locale            # Get and set the default locale
available_locales         # Permitted locales available for the application
enforce_available_locales # Enforce locale permission (true or false)
exception_handler         # Use a different exception_handler
backend                   # Use a different backend

```

## 2.1 Configure the I18n Module

Rails adds all .rb and .yml files from the config/locales directory to the translations load path, automatically.

The I18n library will use English as a default locale, i.e. if a different locale is not set, :en will be used for looking up translations.


## Ref

* <https://github.com/svenfuchs/rails-i18n>
* <https://guides.rubyonrails.org/i18n.html>