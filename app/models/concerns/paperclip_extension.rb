module Concerns
  module PaperclipExtension

    extend ActiveSupport::Concern

    module ClassMethods

      ###
      # Rename filename
      #
      # @note this will register a `before_save` callback
      #
      # @params {[String | Symbol]} *names - attribute names of attachments
      ###
      def attr_file_renamer(*names)
        names.each do |name|
          file_renamer_define_method name
          self.send 'before_save', :"rename_file_#{name}"
        end
      end

      ###
      # Define file renamer for an attribute
      #
      # @params {String | Symbol} name
      # @params {Hash} options - [optional]
      ###
      def file_renamer_define_method(name, options = {})
        define_method("rename_file_#{name}") do
          file = self.instance_eval name.to_s

          if file.queued_for_write.present?
            ext = File.extname file.original_filename
            basename = File.basename file.original_filename, ext
            file_name = "#{Digest::MD5.hexdigest(basename + Time.now.to_i.to_s)}#{ext}"
            file.instance_write :file_name, file_name
          end
        end
      end

      ###
      # Save geometrics of an uploaded image
      #
      # @note this will register a `before_save` callback
      #
      # @params {String | Symbol} name
      # @params {String | Symbol} style - a style name in the image variations
      ###
      def attr_geometory_recorder(name, style)
        geometory_recorder_define_method name, style
        self.send 'before_save', :"record_geometory_#{name}_#{style}"
      end

      ###
      # Define image geometory recorder
      #
      # @params {String | Symbol} name
      # @params {String | Symbol} style
      ###
      def geometory_recorder_define_method(name, style)
        width_attr = :"#{name}_#{style}_width="
        height_attr = :"#{name}_#{style}_height="

        define_method("record_geometory_#{name}_#{style}") do
          file = self.instance_eval name.to_s

          if file.queued_for_write.present?
            geometory = Paperclip::Geometry.from_file file.queued_for_write[style].path
            self.send width_attr, geometory.width
            self.send height_attr, geometory.height
          end
        end
      end

    end

  end
end
