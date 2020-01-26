class Project
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id).to_i
  end

  def ==(project_to_compare)
    @title == project_to_compare.title && @id == project_to_compare.id
  end
end
