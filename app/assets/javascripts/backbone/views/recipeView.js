App.Views.Recipe = Backbone.View.extend( {
	tagName: 'section',
	className: 'ingredients_recipe',
	initialize: function() {
		console.log( 'New recipe View' );
		this.template = HandlebarsTemplates[ 'recipe' ];
		this.render();
	},
	render: function() {
		this.$el.html( this.template( this.model.toJSON() ) );
	},
	events: {
		'click .view': 'showModal'
	},
	showModal: function() {
		// console.log(this.model);
		var recipe = new App.Models.Recipe( {
			id: this.model.toJSON().recipe_id
		} )
		recipe.fetch( {
			url: '/ingredients_recipes/' + recipe.id,
		} ).done( function( data ) {
			// body...
			App.modal.model.set( data );
			// console.log("this is data");
			// console.log(data);

		} )

	}

} );