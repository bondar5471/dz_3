require_relative 'company'

class Carriage
  include Company

  def initialize(company_name)
    @company_name = company_name
  end

  def info
    raise NotImplementedError, 'Нужно переопределить информацию'
  end

end
