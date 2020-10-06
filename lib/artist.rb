class Artist
  attr_reader :id, :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def ==(other_artist)
    self.name == other_artist.name
  end

  def self.all
    returned_artists = DB.exec("SELECT * FROM artists;")
    artists = []
    returned_artists.each do |artist|
      name = artist.fetch('name')
      id = artist.fetch('id').to_i
      artists.push(Artist.new({:name => name, :id => id}))
    end
    artists
  end

  def save
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.clear 
    DB.exec('DELETE FROM artists *;')
  end

  def self.find(id) 
    artist = DB.exec("SELECT * FROM artists WHERE id=#{id};").first
    if artist
      name = artist.fetch('name') 
      id = artist.fetch('id').to_i
      Artist.new({name: name, id: id})
    else
      nil
    end
  end

  def update(name)
    @name = name
    DB.exec("UPDATE artists SET name = '#{name}' WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM artists WHERE id = #{self.id};")
  end

  def albums
  end

end