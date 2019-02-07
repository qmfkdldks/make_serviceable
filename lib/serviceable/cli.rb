require 'thor'
require 'serviceable/generators/service_object'

module Serviceable
  class CLI < Thor
    desc "generate", "create new service object with given name."
    def generate(name)
      Serviceable::Generators::ServiceObject.start([name])
    end
  end
end
