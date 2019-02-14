Feature: Generating service object
  In order to generate many a thing

  Scenario: Recipes
    When I run `make_serviceable generate steak_god`
    Then the following files should exist:
      | app/services/steak_god.rb |
    Then the file "app/services/steak_god.rb" should contain:
      """
      class SteakGod
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
      """
