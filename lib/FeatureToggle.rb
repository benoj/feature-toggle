require 'yaml'

module Features
	class Configuration 
		attr_accessor :features_path
	end

	class FeatureToggle
		def self.configure 
			@@configuration = Configuration.new
			yield(@@configuration)
		end

		def initialize
			YAML.load(@@configuration.features_path)
		end
	end
end