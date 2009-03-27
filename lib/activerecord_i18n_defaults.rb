ActiveRecord::Base.class_eval do

   def self.human_attribute_name(attribute_key_name, options = {})
     defaults = self_and_descendants_from_active_record.map do |klass|
       :"#{klass.name.underscore}.#{attribute_key_name}"
     end
     defaults << "_all.#{attribute_key_name.to_s}".to_sym
     defaults << options[:default] if options[:default]
     defaults.flatten!
     defaults << attribute_key_name.humanize
     options[:count] ||= 1
     I18n.translate(defaults.shift, options.merge(:default => defaults, :scope => [:activerecord, :attributes]))
   end

end
