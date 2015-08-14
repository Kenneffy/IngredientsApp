App.Collections.RecipeCollection = Backbone.Collection.extend( {
	initialize: function() {
		console.log( 'New collection created' );
	},
	url: '/ingredients_recipes',
	model: App.Models.Recipe,
	fetchByTerm: function( term ) {
		this.fetch( {
			url: this.url + '/search',
			data: {
				search: term
			},
			reset: true
		} );
	},
	fetchById: function( id ) {
		model: App.Models.SingleRecipe,
		this.fetch( {
			url: this.url + '/' + id,
			reset: false,
			success: function( coll, data ) {
				App.modal.model.set( data );
			}
		} );
	}
} );