import Cocoa


// create an array of strings,
let artists = ["Sexy Redd", "J.Cole", "J.Cole", "Kendrick Lamar"]

// then write some code that prints the number of items in the array
print(artists.count)

// and also the number of unique items in the array.
let uniqueArtists = Set(artists)

print(uniqueArtists.count)
