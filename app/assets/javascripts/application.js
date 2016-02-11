// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap-material-design
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	
	$.material.init()

	//Manejador de combos
    $(".combo_change").change(function(){
        var origen = $(this);
        var destino = $("#"+origen.data("destino")+"");
        var grupo = $("#"+origen.data("grupo")+"");

        if($(this).val() != '')
        {
            $.ajax({
            	data: { id : origen.val() },
                url:   origen.data("fuente"),
                type:  'POST',
                dataType: 'json',
                beforeSend: function () {
                    origen.prop('disabled', true);
                },
                success:  function (r) 
                {
                    origen.prop('disabled', false);
                    destino.find('option').remove();

                    $(r).each(function(i, v){ // indice, valor
                        destino.append('<option value="' + v.id + '">' + v.name + '</option>');
                    })

                    destino.prop('disabled', false);
                    grupo.show();
                },
                error: function()
                {
                    alert('Ocurrio un error en el servidor ..');
                    origen.prop('disabled', false);
                    grupo.hide();
                }
            });
        }
        else
        {
            destino.find('option').remove();
            destino.prop('disabled', true);
            grupo.hide();
        }
    }) // fin Manejador de combos

});



    