require 'rack'
require 'sass/plugin'rack'

use Rack::Static, urls: ['/stylesheets'], root: 'public'

Sass::Plugin.options[:style] = :compressed
Sass::Plugin.add_template_location('app/assets/stylesheets')
use Sass:Plugin::Rack

run lambda { |_env|
  [
    200,
    {
      'Content-Type' => 'text/html'
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
