class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :long_url, presence: true
  validates :long_url, uniqueness: true

    before_create :counter, :shorten_url


  def shorten_url
    allchars = Array('A'..'Z') + Array('a'..'z') + Array(1..9)
    extension = Array.new(8) { allchars.sample }.join
    self.short_url = extension

  end

  def counter
    self.click_count = 0
  end

end
