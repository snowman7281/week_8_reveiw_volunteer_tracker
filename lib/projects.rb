class Project

  attr_reader :id
  attr_accessor :name, :project_info, :volunteer

  def initialize(attributes)
    @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
    @project_info = (attributes.key?(:project_info) ? attributes.fetch(:project_info) : nil)
    @volunteer = (attributes.key?(:volunteer) ? attributes.fetch(:volunteer) : nil)
  end

end
