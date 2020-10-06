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
      artist.update('Beyonce')
      expect(artist.name).to(eq('Beyonce'))
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