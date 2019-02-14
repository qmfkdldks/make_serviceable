require 'thor/group'
require 'active_support/inflector'

module MakeServiceable
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
        puts name.underscore
        puts name.classify
        template("service_template.rb", "app/services/#{name.underscore}.rb")
      end

    end
  end
end
