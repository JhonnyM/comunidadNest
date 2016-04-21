// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-multiselect
//= require jquery.barrating.min
//= require chosen-jquery
//= require unslider-min
//= require fbsdk
//= require masonry.pkgd.min.js
//= require imagesloaded.pkgd.min.js
//= require jquery.remotipart
//= require rails.validations
//= require_tree .

//Funciones para form de agregar participante
function initializeParticipantesForm(){
    jQuery('.step').hide();
    var submitbtn = $('#send');
    submitbtn.hide();
    submitbtn.prop('disabled', true);
}
function showStep(n){
    $('.step'+n).show();
}
function showType(type){
    $('.selector').hide();
    $('#'+type).show();
}

function fillParticipanteField(){

}

function showStep3(fuente){
    $('#nest').hide();
    $('#custom').hide();
    $('.step3').show();
    $('div#'+fuente).show();

    //var participanteField = "#participante_proyecto_participante_id";
}
$(document).ready(function(){
  // Home
  $('#main-slider').unslider({
      autoplay: true,
      delay: 8000,
      arrows: false,
      nav: false
  });

  //Quick and dirty fix to temporarily fix images and links in blog. Just to demo it.
  //Need to fix the strings in the database
  if ($('article a').size() > 0) {
    $('article a').addAttribute('target', '_blank');
  }

  $('.radio-filters input[type="radio"]').change(function() {
    this.form.submit();
  });
});
