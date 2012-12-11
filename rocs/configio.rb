require 'yaml'

class ConfigIO
    attr_reader :config

    def initialize
        @@default = {}
        #TODO someone needs to fill in the default config
        @config = Hash.new
    end

    def unify_default
        @@default.each{ |k,v|
            @config[k] = v if not @config.key? k
            @config[k] = v if @config[k] = nil
        }
        @config
    end

    def write
        File.open("config.yml", "w") { |f| f.write(@config.to_yaml)}
    end

    def read
        raw_config = YAML.load_file("config.yml")
        raw_config.each{ |k, v|
           @config[k] = v
        }
        unify_default
    end
end