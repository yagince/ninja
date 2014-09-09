module Ninja
  class Hash < Hash
    def initialize hash
      self.replace hash
      hash.keys.each{|key| define(key) }
    end

    def []=(key, value)
      super(key, value)
      define(key)
    end

    def get(key, &block)
      unless value = self.send(key)
        block && block.call
      else
        value
      end
    end

    def method_missing(name, *args)
      if md = name.to_s.match(/(.+)=\z/)
        define(md[1])
        self.send(name, *args)
      end
      nil
    end

    private
    def define key
      define_singleton_method(key) {
        value = case key
                when String
                  (self[key] || self[key.to_sym])
                else
                  (self[key] || self[key.to_s])
                end
        if value.is_a?(::Hash)
          value = Ninja::Hash.new(value)
          self[key] = value
        end
        value
      }

      define_singleton_method("#{key}=") {|value|
        self[key] = value
      }
    end
  end
end

class Hash
  def to_ninja_hash
    Ninja::Hash.new(self)
  end
  alias :ninja :to_ninja_hash
end
