class Volunteer
  attr_reader(:id, :name, :project_id)

  def initialize(attributes)
    @id = attributes.fetch(:id) || nil
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def name
    @name
  end

  def project_id
    @project_id
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def save
    results = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = results.first["id"].to_i
  end

  def ==(another_volunteer)
    self.name == another_volunteer.name && self.project_id == another_volunteer.project_id
  end

  def self.find(id)
    results = DB.exec("SELECT * FROM volunteers WHERE id = #{:id};")
    if results.any?
      return Volunteer.new({
        id: results.first["id"].to_i,
        name: results.first["name"],
        project_id: results.first["project_id"].to_i
      })
    end
  end

  def update(attributes)
    @name = attributes.fetch(:name)
    DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{:id};")
  end

  def delete
   DB.exec("DELETE FROM volunteers WHERE id = #{:id};")
  end

end
