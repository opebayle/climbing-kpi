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
//= require turbolinks
//= require_tree .
// Loads all Semantic javascripts
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown


document.addEventListener("turbolinks:load", function() {

  // $('table').tablesort()

  if($("body").data().controllerName == "routes"  && ($("body").data().actionName == "edit" || $("body").data().actionName == "new")) {
    $('#map').click(function (e) { //Offset mouse Position
      var posX = $(this).offset().left + 6,
      posY = $(this).offset().top + 8;

      percentX = Math.trunc((e.pageX - posX)/$(this).width()*100)
        percentY = Math.trunc((e.pageY - posY)/$(this).height()*100)

        $('#posy').val(percentX)
        $('#posx').val(percentY)

        $( "#new" ).remove()


        $( "#map" ).append( "<div id='new' style='position:absolute; top:"+percentY+"%; left:"+percentX+"%'></div>" );
      $( "#new" ).append( "<i class='crosshairs icon' style='color:red;'></i>" );
    });
  }
})



$(document).ready(function (e) {

});
