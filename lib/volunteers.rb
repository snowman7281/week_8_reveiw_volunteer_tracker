class Volunteer

  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
    @project_id = (attributes.key?(:project_id) ? attributes.fetch(:project_id) : nil)
  end

end
