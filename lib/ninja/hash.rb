class Ninja::Hash < Hash
  def initialize hash
    self.replace hash
    hash.keys.each{|key|
      define(key)
    }
  end

  def []=(key, value)
    super(key, value)
    define(key)
  end

  def method_missing(name, *args)
    self[name] || self[name.to_s]
  end

  private
  def define key
    define_singleton_method(key) { self[key] || self[key.to_s] }
  end
end

class Hash
  def to_ninja_hash
    Ninja::Hash.new(self)
  end
  alias :ninja :to_ninja_hash
end
