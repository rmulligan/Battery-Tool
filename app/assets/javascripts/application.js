// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$(document).ready(function() {
    $("#hibernate").change(function(){
        $("#hibernate").is(":checked") ? $("#sci_label").html("Hibernation check-in rate") : $("#sci_label").html("Stationary check-in rate");
    });

    $("#device_name").change(function(){
        if($("#device_name").val() == 1) {
            $("#hibernate").show();
            $("#motion_hour").hide();
            $("#motion_minute").hide();
        }

        if($("#device_name").val() == 2) {
            $("#hibernate").show();
            $("#motion_hour").show();
            $("#motion_minute").show();
        }

        if($("#device_name").val() == 3) {
            $("#hibernate").show();
            $("#motion_hour").show();
            $("#motion_minute").show();
        }

        if($("#device_name").val() == 4) {
            $("#hibernate").show();
            $("#motion_hour").show();
            $("#motion_minute").show();
        }

        if($("#device_name").val() == 5) {
            $("#hibernate").hide();
            $("#motion_hour").hide();
            $("#motion_minute").hide();
        }

        if($("#device_name").val() == 6) {
            $("#hibernate").hide();
            $("#motion_hour").hide();
            $("#motion_minute").hide();
        }

        if($("#device_name").val() == 7) {
            $("#hibernate").hide();
            $("#motion_hour").show();
            $("#motion_minute").show();
        }
    }


  );
});
