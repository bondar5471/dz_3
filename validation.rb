module Validation
  def self.included(base)
    base.extend ClassMethod
    base.send :include, InstanseMethod
  end

  NUMBER_FORMAT = /^([a-z0-9]){3}-*([a-z0-9]{2})$/i



  protected

  def validate!
    raise 'Номер не должен быть пустым' if number.nil?
    raise 'Номер не должен быть меньше 5 симоволов' if number.length < 5
    raise 'Формат номера не подходит' if number !~ NUMBER_FORMAT
    true
  end

  def valid?
    validate!
  rescue
    false
  end
end

module ClassMethod
  def validate(attribute_name, validation_type, option = true)
    if validates_hash[atribute_name]
      validates_hash[attribute_name][validation_type] = {
          option: option,
          error_messege: validation_errors(validation_type, attribute_name)
      }
    else
      validates_hash[attribute_name] = {
          validation_type => {
              option:option,
              error_message: validation_errors(validation_type, attribute_name)
          }
      }
    end
  end
  def validates_hash
    @validates_hash ||={}
  end

  def validation_errors(type, attr_name)
    case type
    when :presence
      "#{attr_name} не должно равняться 0 или '' "
    when :format
      "#{attr_name} не верный формат"
    when :type
      "#{attr_name} не верный тип"
    end
  end

  def validation_types
    [ :presence, :format, :type ]
  end
end

module InstanceMethods
  def validate!
    self.class.validates_hash.each do |attr_name, value|
      value.each do |key, value|
        self.send("#{key}_validation", value[:error_message], attr_name, value[:option])
      end
    end
    true
  end
  def valid?
    validate!
  rescue
    false
  end
  protected

  def presence_validation(error_message, attr_name, option = true)
    raise error_message if [nil, ''].include?(self.public_send(attr_name))
  end

  def format_validation(error_message, attr_name, option)
    raise error_message if self.public_send(attr_name) !~ option
  end

  def type_validation(error_message, attr_name, option)
    raise error_message unless self.public_send(attr_name).is_a? option
  end
end

