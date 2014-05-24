module Model
  class Base

    def initialize(attrs)
      attrs.each_pair do |key, value|
        self.send("#{key}=", value) if respond_to? "#{key}="
      end
    end

    def self.all
      collection = App::Persistence[self.class]
      if collection.is_a? Array
        collection.map { |resource| new(entry) }
      else
        Array.new
      end
    end

  end
end
