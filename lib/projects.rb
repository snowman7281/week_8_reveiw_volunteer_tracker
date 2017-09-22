class Project
  # attr_reader :id
  attr_accessor :name, :project_info,

  def initialize(attributes)
    # @id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)
    @name = attributes.fetch(:name)
    @project_info = attributes.fetch(:project_info)
  end

  def self.projects_array(arr)
    projects = []
    arr.each() do |project|
      # id = project.fetch("id")
      name = project.fetch("name")
      project_info = project.fetch("projectinfo")
      projects.push(Project.new({:name => name, :project_info => project_info}))
    end
    projects
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    self.projects_array(returned_projects)
  end

  def save()
    result = DB.exec("INSERT INTO projects (name, project_info) VALUES ('#{name}', '#{project_info}') RETURNING id;")
    @id = result.first().fetch("id")
  end

  def ==(another_project)
    self.name().==(another_project.name()).&(self.project_info().==(another_project.project_info()))
  end

  def self.find_project(name)
    project_info = DB.exec("SELECT * FROM projects WHERE name = '#{name}';")
    self.projects_array(project_info)
  end

  def self.unique_volunteer_list(arr)
    projects = []
    arr.each do |project|
      if !projects.include?(project.name)
        projects.push(project.name)
    end
  end
  projects
end

  def self.edit_info(attributes)
    new_name = attributes.fetch(:new_name)
    new_project_info = attributes.fetch(:new_project_info)
    name = attributes.fetch(:name)
    project_info = attributes.fetch(:project_info)
    DB.exec("UPDATE projects SET name = '#{new_name}', project_info = '#{new_project_info}' WHERE name = '#{name}' AND project_info = '#{project_info}';")
  end

  def self.delete_info(attributes)
    name = attributes.fetch(:name)
    project_info = attributes.fetch(:project_info)
    DB.exec("DELETE FROM projects WHERE name = '#{name} AND project_info = '#{project_info}'")
  end

end
