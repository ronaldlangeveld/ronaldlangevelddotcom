# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Compile SCSS (with Bulma) via Dart Sass. Output goes to .tmp/dist, which
# Middleman merges into its asset pipeline (see `source:` below).
activate :external_pipeline,
  name: :sass,
  command: build? ?
    "npx sass --load-path=node_modules --no-source-map --style=compressed ./site.scss:.tmp/dist/stylesheets/site.css" :
    "npx sass --load-path=node_modules --no-source-map --watch ./site.scss:.tmp/dist/stylesheets/site.css",
  source: ".tmp/dist",
  latency: 1

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript, compressor: Terser.new
# end
