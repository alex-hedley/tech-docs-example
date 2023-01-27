# Setup

Cloned repo.

> Required ruby-2.7.3 is not installed.
> To install do: 'rvm install "ruby-2.7.3"'

`ruby -v`

> ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [x86_64-darwin21]

## Site

- http://localhost:4567/

## Config

- [tech-docs.yml](config/tech-docs.yml)

[Project Page Path Issues](https://github.com/edgecase/middleman-gh-pages#project-page-path-issues)

Since project pages deploy to a subdirectory, assets and page paths are relative to the organization or user that owns the repo. If you're treating the project pages as a standalone site, you can tell Middleman to generate relative paths for assets and links with these settings in the build configuration in config.rb

NOTE This only affects sites being accessed at the username.github.io/projectname URL, not when accessed at a custom CNAME.

```ruby
activate :relative_assets
set :relative_links, true
```
