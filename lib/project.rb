class Project
  attr_accessor :title, :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(project_to_compare)
    @title == project_to_compare.title && @id == project_to_compare.id
  end


def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do | project |
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
  @id = result.first().fetch("id").to_i
end

def self.find(id)
    projects = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = projects.fetch("title")
    id = projects.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end

  def update(attributes)
  @title = attributes.fetch(:title)
  DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
end



end