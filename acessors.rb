module Accessor
  def attr_accessor_with_history(*methods)
    methods.each do |method|
      var_name = "#{method}".to_sym
      define_method(method) { instance_variable_get(var_name) }
      define_method("#{method}=".to_sym) { |value| instance_variable_set(var_name) ;self.send("#{method}_history") << value }
    end
  end

  def strong_attr_accessor(method, klass)
    var_name = "@#{method}"

    define_method(method) do
      instance_variable_get(var_name)
    end

    define_method("#{method}=") do |value|
      raise TypeError.new("value is not #{klass}") unless value.is_a?(klass)
      instance_variable_set(var_name, value)
    end
  end
end


class Test
  include Accessor
  attr_accessor_with_history :name, :age
  strong_attr_accessor 'lvl', Fixnum
end