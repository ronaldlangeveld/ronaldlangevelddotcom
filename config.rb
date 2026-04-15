# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Load custom Ruby data modules (data/*.rb).
# Middleman's built-in `data.*` loader only handles YAML/JSON, so these
# don't interfere — they're plain Ruby modules exposing frozen constants.
Dir[File.expand_path('data/*.rb', __dir__)].sort.each { |f| require f }

# Expose the data to templates via helpers.
# Partials call `logos` / `repos` — cleaner than referencing `SiteData::...` directly.
helpers do
  def logos
    SiteData::LOGOS
  end

  def repos
    SiteData::REPOS
  end
end

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
