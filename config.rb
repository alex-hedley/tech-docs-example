require 'govuk_tech_docs'

GovukTechDocs.configure(self)

# https://github.com/edgecase/middleman-gh-pages#project-page-path-issues

# Project Page Path Issues
# Since project pages deploy to a subdirectory, assets and page paths are relative to the organization or user that owns the repo. If you're treating the project pages as a standalone site, you can tell Middleman to generate relative paths for assets and links with these settings in the build configuration in config.rb
# NOTE This only affects sites being accessed at the username.github.io/projectname URL, not when accessed at a custom CNAME.

activate :relative_assets
set :relative_links, true