class <%= name.classify %>
  include MakeServiceable

  # Pass ncessary parameters and then use it in #call
  def initialize()
  end

  # Set service name (optional). Default is class name
  # def service_name
  # end

  # Chage circuit behaviour here. Read documentation of circuitbox
  # def circuit_option
  # {}
  # end

  def call
    # Please implement the service it's protected by circuit breaker pattern.
  end
end
