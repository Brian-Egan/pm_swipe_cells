unless defined?(Motion::Project::Config)
  raise "pm_swipe_cells must be required within a RubyMotion project Rakefile."
end

require 'motion-cocoapods'
# require ''

Motion::Project::App.setup do |app|

  app.name = "pm_swipe_cells"

  # lib_dir_path = File.dirname(File.expand_path(__FILE__))
  # app.files.unshift(Dir.glob(File.join(lib_dir_path, "timestamps/**/*.rb")))

  Dir.glob(File.join(File.dirname(__FILE__), 'pm_swipe_cells/*.rb')).each do |file|
    # app.files.unshift(file)
    app.files << file
  end

  app.pods do
    pod 'SWTableViewCell', '~> 0.3.7'
  end


end

