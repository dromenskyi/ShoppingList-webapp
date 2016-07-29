'use strict';

function SavedListFormController () {
														LOGGER.debug('SavedListFormController initialized');
	this.listService = new ListService();
}

SavedListFormController.prototype
	.changeProductStatus = function (/*listForm, */clicked) {
														LOGGER.debug('Trying to change product status');
		var button = $(clicked).is('button')? clicked : $(clicked).parent();

		var targetProductId = $(button).data('target');
		var targetListId = $(button).data('targetList');
														LOGGER.debug('Searching for targets - Product[' + targetProductId + ']; List[' + targetListId + ']');
		var listForm = $('#' + targetListId + '.sl-list-wrapper');

		$('#' + targetProductId, listForm).toggleClass('sl-bought-product');
		$(button).toggleClass('btn-success btn-warning');
		$('i', button).toggleClass('fa-cart-plus fa-minus');
														LOGGER.debug('Starting building a new list state');
		var list = new List();

		list.key = $(listForm).attr('id');
		list.bought = $('.panel', listForm).hasClass('panel-default');
		list.owner = IS_ANON? -1: CURRENT_USER;
		list.anonymousOwner = CURRENT_ANON_USER;
														LOGGER.debug('Starting adding products to list');
		$(SAVED_PRODUCT_CLASS, listForm).each(function(index, item) {

			var productName = $('.sl-product-name', item).text();
			var product = new Product(productName);
			product.key = $(item).attr('id');
			product.bought = $(item).hasClass('sl-bought-product');
			list.content.push(product);
		});

		if (list.content.length === 0) {
														LOGGER.debug('No products in a list. Exiting.');
			return;
		}

														LOGGER.debug('Initiating list update');
		this.listService.updateList(list)
			.done(function(data) {
														LOGGER.debug('List successfully updated');
				$(ALERT_SUCCESS).text('Successfully');
				$(ALERT_SUCCESS).toggleClass('hidden');
			})
			.fail(function(jqXHR, textStatus, errorThrown) {
														LOGGER.debug('Failed to update list');
				$(ALERT_DANGER).text(errorThrown);
				$(ALERT_DANGER).toggleClass('hidden');
			});

	};

SavedListFormController.prototype
	.buyList = function (/*listForm,*/ button) {

														LOGGER.debug('Trying to buy a list');
		var listId = $(button).data('target');
		var listForm = $('#' + listId + '.sl-list-wrapper');

		$('.panel', listForm).removeClass('panel-success');
		$('.panel', listForm).addClass('panel-default');
														LOGGER.debug('Starting building a new list state');
		var list = new List();

		list.key = $(listForm).attr('id');
		list.bought = $('.panel', listForm).hasClass('panel-default');
		list.owner = IS_ANON? -1: CURRENT_USER;
		list.anonymousOwner = CURRENT_ANON_USER;
														LOGGER.debug('Starting adding products to list');
		$(SAVED_PRODUCT_CLASS, listForm).each(function(index, item) {
			var productName = $('.sl-product-name', item).text();
			var product = new Product(productName);
			product.key = $(item).attr('id');
			product.bought = $(item).hasClass('sl-bought-product');
			list.content.push(product);
		});

		if (list.content.length === 0) {
														LOGGER.debug('No products in a list. Exiting.');
			return;
		}
														LOGGER.debug('Initiating list update');
		this.listService.updateList(list)
			.done(function(data) {
														LOGGER.debug('List successfully updated');
				$(ALERT_SUCCESS).text('Successfully');
				$(ALERT_SUCCESS).toggleClass('hidden');
			})
			.fail(function(jqXHR, textStatus, errorThrown) {
														LOGGER.debug('Failed to update list');
				$(ALERT_DANGER).text(errorThrown);
				$(ALERT_DANGER).toggleClass('hidden');
			});
	};

