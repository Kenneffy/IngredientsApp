App.Views.RecipeList = Backbone.View.extend( {
	el: '#recipe-list',
	initialize: function() {
		console.log( 'New List View' );
		this.listenTo( this.collection, 'reset', this.addAll );
	},
	addAll: function() {
		this.collection.each( this.addRecipe, this );
	},
	addRecipe: function(recipeModel) {
		var recipe = new App.Views.Recipe({ model: recipeModel});
		this.$('#recipes').prepend(recipe.el)
		 var container = $("#recipes")[0]
          var msnry = new Masonry(container);
          msnry.layout();
	},
	events: {
		'click .search': 'search'
	},
	search: function() {
		// console.log('hello')
		var term = escape( $( '#recipe-search' ).val() );
		this.collection.fetchByTerm( term );
	}

} );