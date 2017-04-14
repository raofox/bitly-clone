
require 'csv'
require 'byebug'

# ==> creates a short url
  def shorten_url
    allchars = Array('A'..'Z') + Array('a'..'z') + Array(1..9)
    extension = Array.new(8) { allchars.sample }.join
  end

longurl =[]

  # Url.transaction do
    CSV.foreach("db/urls.csv") do |row|
      longurl << row[0].gsub!(/\((.+)\)/,'\1')
      # url = Url.new(long_url: p[0])
      # url.save_for_bulk_import!
    end
  # end
count = 0
  Url.transaction do
    longurl.each do |long_url|
      count += 1
      p count
      Url.connection.execute("INSERT INTO urls (long_url, short_url, click_count) VALUES ('#{long_url}', '#{shorten_url}', 0)")
    end
  end
