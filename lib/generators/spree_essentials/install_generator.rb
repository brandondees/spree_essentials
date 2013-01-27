module SpreeEssentials
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      desc "Installs required migrations for spree_essentials"

      class_option :add_stylesheets, :type => :boolean, :default => true, :banner => 'Append spree_essentials to admin/all.css'
      class_option :add_javascripts, :type => :boolean, :default => true, :banner => 'Append spree_essentials to admin/all.js'

      def append_stylesheets
        return unless options[:add_stylesheets]
        gsub_file "app/assets/stylesheets/admin/all.css", "*/", "*= require admin/spree_essentials\n*/"
      end

      def append_javascripts
        return unless options[:add_javascripts]
        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_essentials"
      end

      def add_files
        copy_file 'config/tinymce.yml'
      end

    end
  end
end
