require "serviceable/version"

module Serviceable
  class Error < StandardError; end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def call(*args)
      circuit.run do
        new(*args).call
      end
    end
  end

  # protected
  def service_name
    self.class.name
  end

  def circuit_options
    {}
  end

  private
  def circuit
    Circuitbox.circuit(service_name, circuit_options)
  end
end
