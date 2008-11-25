module I18n

  class << self
    def translate(key, options = {})
      locale = options.delete(:locale) || I18n.locale
      if options[:default].nil? && key.to_s.include?("activerecord.attributes.")
        options[:default] = "activerecord.global-attributes.#{key.to_s.split(".").last}".to_sym
      end
      backend.translate(locale, key, options)
    rescue I18n::ArgumentError => e
      raise e if options[:raise]
      send(@@exception_handler, e, locale, key, options)
    end
    alias :t :translate
  end
  
end
