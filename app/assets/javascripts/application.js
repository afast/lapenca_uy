// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require foundation.min
//= require foundation/foundation.topbar
//= require_tree .
//= require_self

String.prototype.titleize = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

function ready(){
  $(document).foundation();

  $('li .row.match').on('change keyup', 'input', function(ev){
    forecast();
  });
  $('dd').on('click', 'a', function(ev){
    setTimeout(forecast, 50);
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);
