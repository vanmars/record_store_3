require 'spec_helper'

describe('#Artist') do

describe('#==') do
  it('is the same artist if it has the same attributes as another artist') do
    artist = Artist.new({name: 'Surfaces', id: nil})
    artist2 = Artist.new({name: 'Surfaces', id: nil})
    expect(artist).to(eq(artist2))
  end
end

 describe('.all') do
    it('returns an empty array when there are no artists') do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an artist') do
      artist = Artist.new({name: 'Surfaces', id: nil})
      artist.save
      artist2 = Artist.new({name: 'Alessia Cara', id: nil})
      artist2.save
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it('clears all artists') do
      artist = Artist.new({name: 'Surfaces', id: nil})
      artist.save
      artist2 = Artist.new({name: 'Alessia Cara', id: nil})
      artist2.save
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds an artist by id') do
      artist = Artist.new({name: 'Surfaces', id: nil})
      artist.save
      artist2 = Artist.new({name: 'Surfaces', id: nil})
      artist2.save
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it('updates an artist by id') do
      artist = Artist.new({name: 'Surfaces', id: nil})
      artist.save
      artist.update({name:'Beyonce'})
      expect(artist.name).to(eq('Beyonce'))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

  describe('#update') do
    it("does not add an album to an artist if association already exists") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

  describe('#update') do
    it("adds an instance of an album if it doesn not exist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      # album = Album.new({:name => "A Love Supreme", :id => nil})
      # album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(Album.all.length).to(eq(1))
      expect(artist.albums.length).to(eq(1))
    end
  end

  describe('#delete') do
    it('deletes an artist by id') do
      artist = Artist.new({name: 'Surfaces', id: nil})
      artist.save
      artist2 = Artist.new({name: 'Surfaces', id: nil})
      artist2.save
      artist2.delete
      expect(Artist.all).to(eq([artist]))
    end
  end


end