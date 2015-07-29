# -*- encoding: utf-8 -*-
# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version/version.rb', __FILE__)
Gem::Specification.new do |gem|
  gem.name        = "pm_swipe_cells"
  gem.version     = PMSwipeCell::VERSION
  gem.summary     = %q{Add customizable swipe actions to ProMotion table cells}
  gem.description = %q{Easily add animated swipeable content view to ProMotion TableScreen cells (using pod 'SWTableViewCells')}
  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  gem.files         = files
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  # gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
  gem.homepage    = "https://github.com/Brian-Egan/pm_swipeable_cells"
  gem.authors     = ["Brian Egan"]
  gem.email       = "brianegan@outlook.com"
  gem.license     = "MIT"

  gem.add_dependency "ProMotion", "~> 2.0"
  gem.add_dependency "motion-cocoapods", "~> 1.4"

  gem.add_development_dependency "motion-stump", "~> 0.3"
  gem.add_development_dependency "motion-redgreen", "~> 0.1"
  gem.add_development_dependency "rake"
  gem.add_development_dependency 'motion_print'

end





