require 'csv'
require 'lisbn'

incsv = CSV.open("books_movies.tsv", "r", col_sep:"\t", headers:true)
outcsv = CSV.open("books_movies_.tsv", "w", col_sep:"\t", write_headers:true, headers:incsv.headers)

incsv.each do |row|
  row["book:isbn"] = Lisbn.new(row["book:isbn"]).isbn13
  outcsv << row
end
