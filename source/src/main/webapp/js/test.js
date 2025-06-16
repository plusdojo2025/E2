$(function() {
  $('.hamburger').click(function() {
    $(this).toggleClass('active');
    $('.menu').toggleClass('open');
  });
});
