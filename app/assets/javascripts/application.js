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
        if($("#device_name").val() == "F2i") {
            $("#hibernate").show();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#stationary_hour").show();
            $("#stationary_minute").show();
            $("#tim_percent").show();
        }

        if($("#device_name").val() == "F2x") {
            $("#hibernate").show();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#stationary_hour").show();
            $("#stationary_minute").show();
            $("#tim_percent").show();
        }
        if($("#device_name").val() == "F3") {
            $("#hibernate").show();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#stationary_hour").show();
            $("#stationary_minute").show();
            $("#tim_percent").show();
        }

        if($("#device_name").val() == "PT200") {
            $("#hibernate").hide();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#tim_percent").hide();
            $("#stationary_hour").hide();
            $("#stationary_minute").hide();

        }
        if($("#device_name").val() == "SLM") {
            $("#hibernate").hide();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#stationary_hour").hide();
            $("#stationary_minute").hide();
            $("#tim_percent").hide();
        }
        if($("#device_name").val() == "Mini MT") {
            $("#hibernate").hide();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#tim_percent").hide();

        }

        if($("#device_name").val() == "AT4000") {
            $("#hibernate").hide();
            $("#motion_hour").hide();
            $("#sci_label").html("Hibernation check-in rate");
            $("#motion_minute").hide();
            $("#stationary_hour").show();
            $("#stationary_minute").show();
            $("#tim_percent").hide();
        }
        if($("#device_name").val() == "ILC1500") {
            $("#hibernate").show();
            $("#sci_label").html("Stationary check-in rate");
            $("#motion_hour").show();
            $("#motion_minute").show();
            $("#stationary_hour").show();
            $("#stationary_minute").show();
            $("#tim_percent").show();
        }
    }

  );
});
