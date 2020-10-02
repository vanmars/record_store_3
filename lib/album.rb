class Album
  attr_reader :id, :name, :year, :genre, :artist, :sold_albums, :albums 

  @@albums = {}
  @@total_rows = 0 
  @@sold_albums = {}

  def initialize(name, id, year, genre, artist) 
    @name = name
    @id = id || @@total_rows += 1  
    @year = year
    @genre = genre
    @artist = artist
  end

  def self.all
    @@albums.values()
  end

  def self.sold_albums
    @@sold_albums.values()
  end

  def self.search(name)
    results = []
    self.all.each do |album|
      if album.name.match?(/#{name}/i)
        results.push(album)
      end
    end
    results
  end

  # def self.searh(name)
  #   result = self.all.select {|album| album.name.include?(name)}
  #   return result
  # end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.sort
    @albums_sorted = @@albums.values.sort_by {|album| album.name}
  end

  def update(name, year, genre, artist)
    @name = name
    @year = year
    @genre = genre
    @artist = artist
  end

  def delete
    @@albums.delete(self.id)
  end

  def sold
    @@sold_albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end
end
