puts "Cleaning database..."
Movie.destroy_all

puts "Creating movies..."


url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']


movies.each do |movie|

  poster_url_complete = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"

  new_movie = Movie.new(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: poster_url_complete,
    rating: movie['vote_average'],
  )

  new_movie.save!

end

puts "Finished!"
