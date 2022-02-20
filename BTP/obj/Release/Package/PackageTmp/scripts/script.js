$(function () {
  $(".dashboard ul li a.list").on("click", function () {
    let el = $("." + $(this).data("list"));
    if ($("." + $(this).data("list") + ".sublinks").css("display") === "none") {
      el.slideDown(800);
    } else {
      el.slideUp(800);
    }
  });
  $(".show-dashboard").on("click", function () {
    $(".dashboard").animate({ left: "0" }, 1000);
  });
  $(".x").on("click", function () {
    $(".dashboard").animate({ left: "-99.8vw" }, 1000);
  });
    $('main .content nav section .user').click(function () {
      console.log("show");
      $('main .content nav section .user .logout').fadeIn(800);
  });
});
