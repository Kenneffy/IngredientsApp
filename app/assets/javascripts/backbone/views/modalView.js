App.Views.Modal = Backbone.View.extend( {
	el: '#modal',
	initialize: function() {
		console.log( 'modal created' );
		this.template = HandlebarsTemplates[ 'modal' ];
		this.listenTo( this.model, 'change', this.showModal );
		// console.log("helloooo this is the model" + this.model);
		// console.log(this.model.toJSON())
	},
	render: function() {
		// console.log("in the render modal")
		// console.log(this.model);
		// debugger;
		App.modal.model.set( this.model.toJSON() );
		this.$el.html( this.template( this.model.toJSON() ) );
	},
	showModal: function() {
		this.render();
		this.$el.fadeIn( 1000 );
	},
	events: {
		'click .close': 'returnToSearch',
		'click .comment': 'insertCommentIntoDatabase',
		'click .try': 'insertToDatabase'
	},
	returnToSearch: function() {
		this.$el.empty();
		this.$el.fadeOut( 100 );
	},
	insertToDatabase: function() {
		//create recipe first

		var recipe_object = this.model.attributes.recipe;

		$.ajax( {
			type: 'POST',
			data: {
				'ingredients_recipe': {
					"name": recipe_object.recipe.title,
					"endpoint": recipe_object.recipe.recipe_id,
					"f2f_recipe_id": recipe_object.recipe.recipe_id,
					"f2f_img_url": recipe_object.recipe.image_url
				}
			},
			url: '/ingredients_recipes',
			dataType: 'JSON'
		} ).done( function( response ) {

			var response_id = response.id;
			// console.log( response_id );
			$.ajax( {
				type: 'POST',
				data: {
					'user_try': {
						'try': true,
						'ingredients_recipe_id': response_id
					}
				},
				url: '/user_tries',
				dataType: 'JSON'
			} ).done( function( response ) {

				// alert( 'done' )
				console.log( 'done' );
			} ).fail( function( jqXHR, textStatus ) {
				console.log( jqXHR.responseText );
			} );
		} ).fail( function( jqXHR, textStatus ) {
			console.log( jqXHR.responseText );
		} );



	},

	insertCommentIntoDatabase: function() {
		//create recipe first

		var recipe_object = this.model.attributes.recipe;

		$.ajax( {
			type: 'POST',
			data: {
				'ingredients_recipe': {
					"name": recipe_object.recipe.title,
					"endpoint": recipe_object.recipe.recipe_id,
					"f2f_recipe_id": recipe_object.recipe.recipe_id,
					"f2f_img_url": recipe_object.recipe.image_url
				}
			},
			url: '/ingredients_recipes',
			dataType: 'JSON'
		} ).done( function( response ) {

			var response_id = response.id;
			// console.log( response_id );

			var comment = $( '.incomment' ).val();

			$.ajax( {
				type: 'POST',
				data: {
					'comment': {
						'comment': comment,
						'ingredients_recipe_id': response_id
					}
				},
				url: '/comments',
				dataType: 'JSON'
			} ).done( function( response ) {
				var recipe_id = response.ingredients_recipe_id;

				$.ajax( {
					type: 'GET',
					url: '/comments/' + recipe_id,
					dataType: 'JSON'

				} ).done( function( response ) {
					debugger;
					console.log( response );
					var holdMe = $( '#comments-holder' );
					holdMe.empty();
					var commentTemplate = HandlebarsTemplates[ 'comments' ];
					var commentHTML = commentTemplate( {
						'comments': response
					} );

					holdMe.html( commentHTML );

					// create new html overlay old.
				} ).fail( function( jqXHR, textStatus ) {
					console.log( jqXHR.responseText );
				} );

				// alert( 'done' )
				console.log( 'done inserting comment' );
			} ).fail( function( jqXHR, textStatus ) {
				console.log( jqXHR.responseText );
			} );
		} ).fail( function( jqXHR, textStatus ) {
			console.log( jqXHR.responseText );
		} );




	}

} );