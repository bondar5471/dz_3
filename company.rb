module Company
  attr_accessor :name_company

  def initialize(name_company)
    @name_company = name_company
  end

  def print_name_company
    p @name_company
  end
end
