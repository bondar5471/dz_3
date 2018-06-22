class Carriage
  include Company

  def initialize(company_name)
    @company_name = company_name
  end
  def type
    raise NotImplementedError, 'Sorry you need override type'
  end
end
