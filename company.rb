module Company

  attr_accessor :name

  def initialize(name_company)
    @name_company = name_company
  end

  def print
    p @name_company
  end
end
