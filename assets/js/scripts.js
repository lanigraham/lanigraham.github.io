$(document).ready(function(){

  //initiate the parallax
  $('.parallax').parallax();

//initiate CV pushpin
  $('#CVbtn').pushpin({offset: 20 });

  //initiate drop down
  $('.collapsible').collapsible();



//CV button scrolling
  $('#introductionBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pIntro").offset().top
    }, 1000);
  })

  $('#experienceBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pExperience").offset().top
    }, 1000);
  })

  $('#modulesBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pModules").offset().top
    }, 1000);
  })

  $('#educationBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pEducation").offset().top
    }, 1000);
  })

  $('#workBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pWork").offset().top
    }, 1000);
  })

  $('#languagesBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pLanguages").offset().top
    }, 1000);
  })

  $('#additionBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pAdditional").offset().top
    }, 1000);
  })

  $('#hobbiesBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pHobbies").offset().top
    }, 1000);
  })

  $('#otherBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pOther").offset().top
    }, 1000);
  })

  $('#contactBtn').click(function(e) {
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $("#pContact").offset().top
    }, 1000);
  })


  ///search bar for languages

  $('#handleSearch').submit(function(e){
    e.preventDefault();
    $("#searchLanguages td").css("color", "black");

    $("#searchLanguages td").filter(function() {
      return $(this).text().toUpperCase() == $('#languages').val().toUpperCase();
  }).css("color", "red");;

  })







});
