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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require ckeditor/init
//= require_tree .

$(document).ready(function(){

    $('#ooo').click(function(){
        openNav();
        $(this).css('display', 'none');
        $('.sidenav').css('padding', '3%');
        $("#ccc").css('display', 'inline');
    });

    $('#ccc').click(function(){
        closeNav();
        $('.sidenav').css('padding', '0%');
        $(this).css('display', 'none');
        $("#ooo").css('display', 'inline');
    });

    function openNav() {

        $("#mysidenav").css('width', 250);
        $("#main").css('margin-left', 250);
    };

    function closeNav() {

        $("#mysidenav").css('width', 0);
        $("#main").css('margin-left', 0);
    };
});