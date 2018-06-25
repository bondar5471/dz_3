module InstanceCounter
  def self.included(base)
    base.extend ClassMethod
    base.send :include, InstanseMethod
  end

  module ClassMethod
    attr_accessor :instances
  end

  protected
  module InstanseMethod
    protected
    self.class.instances ||= 0
    self.class.instances += 1
  end
end