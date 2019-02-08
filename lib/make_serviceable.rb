require "make_serviceable/version"
require "circuitbox"

module MakeServiceable
  class Error < StandardError; end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def service_name
      self.name
    end

    def circuit_options
      {}
    end

    def circuit
      Circuitbox.circuit(service_name, circuit_options)
    end

    def call(*args)
      obj = new(*args)
      circuit.run do
        obj.call
      end
    end
  end

end
