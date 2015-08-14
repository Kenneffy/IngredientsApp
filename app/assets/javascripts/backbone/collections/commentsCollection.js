// commentsCollection.js

App.Collections.CommentCollection = Backbone.Collection.extend( {
	initialize: function() {
		console.log( 'New comment collection created' );
	},
	url: '/comments',
	model: App.Models.Comment,

	fetchById: function( recipe_id ) {
		model: App.Models.Comment,
		this.fetch( {
			url: this.url + '/comments' + recipe_id,
			reset: false,
			success: function( coll, data ) {
				App.modal.model.set( data );
			}
		} );
	}
} );