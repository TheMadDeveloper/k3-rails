require "k3/version"
require "rake"

module K3
  # Your code goes here...
  class RakeTasks < Rails::Railtie
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end
  end
end
