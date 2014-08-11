var DEFAULT_ANIMATION_MILLIS = 300;
var DEFAULT_DURATION_MILLIS = 1500;

function animateCrouton(crouton) {
  animationMillis = crouton.data('animation') || DEFAULT_ANIMATION_MILLIS;
  durationMillis = crouton.data('duration') || DEFAULT_DURATION_MILLIS;

  crouton.animate({height: 'toggle'}, animationMillis, 'swing', function hideCrouton() {
    crouton.delay(durationMillis).animate({ height: 'toggle' }, animationMillis, 'swing', removeCrouton);
  });
}

function removeCrouton() {
  $(this).remove();
}

$.fn.showCrouton = function(crouton) {
  $(this).before(crouton.hide());
  animateCrouton(crouton);
}

$.fn.showCroutons = function(croutons) {
  placeholder = $(this);
  $(croutons).each(function(i) {
    placeholder.showCrouton($(this));
  });
}
