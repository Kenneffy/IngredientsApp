class Recipe

	API_ROOT = 'http://food2fork.com/api/'

	def self.search(term)
		query_string = [API_ROOT, 'search?key=a5211143cab0c6434f03db6cbc03268e&q=', term].join('')
		query_string = URI.escape(query_string)
		results = HTTParty.get(query_string)
		return JSON.parse(results)
	end

	def self.search_by_id(id)
		query_string = [API_ROOT, 'get?key=a5211143cab0c6434f03db6cbc03268e&rId=', id].join('')
		results = HTTParty.get(query_string)
		return JSON.parse(results)
	end

end

# class OMDB

# 	API_ROOT = 'http://www.omdbapi.com/?'

# 	def self.search(term)
# 		query_string = [API_ROOT, 's=', term].join('')
# 		query_string = URI.escape(query_string)
# 		results = HTTParty.get(query_string)['Search']
# 		return results
# 	end

# 	def self.search_by_id(imdbID)
# 		query_string = [API_ROOT, 'i=', imdbID].join('')
# 		results = HTTParty.get(query_string)
# 		return results
# 	end

# end