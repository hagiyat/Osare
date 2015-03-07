require 'osare/version'

module Osare
  module ClassMethods
    def osare(method, decorate_targets)
      decorate_targets.tap { |v| break [v] unless v.is_a? Array }.each do |target|
        Osare.decorate_method(method, target)
      end
    end
  end

  def self.prepended(klass)
    class << klass
      prepend ClassMethods
    end
  end

  def self.decorate_method(method, target_method)
    if method_defined? target_method
      nested_method = "#{target_method.to_s}_without_#{method.to_s}".to_sym
      alias_method nested_method, target_method
      define_method(target_method) do |*args|
        send(method, *args) { send(nested_method, *args) }
      end
    else
      define_method(target_method) do |*args|
        send(method, *args) { super(*args) }
      end
    end
  end
end
