# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	if $('.grid-images').length > 0
		$grid = $('.grid-images').imagesLoaded ->
		  $grid.masonry
		    itemSelector: '.grid-item'
		    percentPosition: true
		    columnWidth: '.grid-sizer'
