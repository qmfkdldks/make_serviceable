require 'thor'
require 'make_serviceable/generators/service_object'

module MakeServiceable
  class CLI < Thor
    desc "generate", "create new service object with given name."
    def generate(name)
      MakeServiceable::Generators::ServiceObject.start([name])
    end
  end
end
