class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)  # refactor of an if statement.  if findbyname is true, return findbyname else print create is refactored to this  
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    name_array = filename.slice(0, filename.length-4).split(" - ")
    song = self.new
    song.name = name_array[1]
    song.artist_name = name_array[0]
    song
  end

  def self.create_from_filename(filename)
    name_array = filename.slice(0, filename.length-4).split(" - ")
    song = self.new
    song.name = name_array[1]
    song.artist_name = name_array[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
