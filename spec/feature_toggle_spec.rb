require 'rspec'
require 'yaml'
require 'FeatureToggle'

describe Features::FeatureToggle do
	context '#initialize' do 
		['./features.yml','./other_features.yml'].each do |file_path|
			it "should load #{file_path} from config" do
				Features::FeatureToggle.configure do |config|
					config.features_path = file_path
				end
				feature_toggle = Features::FeatureToggle.new
				YAML.stub(:load).with(file_path).and_return({})
			end 
		end
	end
end