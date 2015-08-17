class Recipe

	API_ROOT = 'http://food2fork.com/api/'

	def self.search(term)
		query_string = [API_ROOT, 'search?key=95fa5272d2a677ab13abe287179a459e&q=', term].join('')
		# query_string = [API_ROOT, 'search?key=a5211143cab0c6434f03db6cbc03268e&q=', term].join('')
		query_string = URI.escape(query_string)
		results = HTTParty.get(query_string)
		return JSON.parse(results)
	end

	def self.search_by_id(id)
		query_string = [API_ROOT, 'get?key=95fa5272d2a677ab13abe287179a459e&rId=', id].join('')
		# query_string = [API_ROOT, 'get?key=a5211143cab0c6434f03db6cbc03268e&rId=', id].join('')
		results = HTTParty.get(query_string)
		return JSON.parse(results)
	end

end

