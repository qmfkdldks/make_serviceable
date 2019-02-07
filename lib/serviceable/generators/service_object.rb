require 'thor/group'

module Serviceable
  module Generators
    class ServiceObject < Thor::Group
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      argument :name, type: :string

      # def create_group
      #   empty_directory("app/services")
      # end

      def copy_recipe
        template("service_template.rb", "app/services/#{name.downcase}.rb")
      end

    end
  end
end
