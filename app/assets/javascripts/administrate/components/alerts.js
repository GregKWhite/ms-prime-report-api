$(document).on('ready', fadeFlashes);

function fadeFlashes() {
  $('.flashes').delay(500).fadeIn('normal', function() {
    $(this).delay(2500).slideUp();
  });
};
