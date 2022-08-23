var slideIndex = 1;
showSlides(slideIndex);
setInterval(autoSlides, 8000); //1000에 1초임

function autoSlides() {
    slideIndex++;

    showSlides(slideIndex);

}

//     ,          

function plusSlides(n) {

    showSlides(slideIndex += n);

}

//          

function currentSlide(n) {

    showSlides(slideIndex = n);

}

function showSlides(n) {

    var i;

    var slides = document.getElementsByClassName("mySlides");

    var dots = document.getElementsByClassName("dot");

    if (n > slides.length) {
        slideIndex = 1
    }

    if (n < 1) {
        slideIndex = slides.length
    }

    for (i = 0; i < slides.length; i++) {

        slides[i].style.display = "none";

    }

    for (i = 0; i < dots.length; i++) {

        dots[i].className = dots[i]
            .className
            .replace(" active", "");

    }

    slides[slideIndex - 1].style.display = "block";

    dots[slideIndex - 1].className += " active";

}

/* 흑흑 
const totop = document.querySelector(".button_top");
//페이지가 상단에서 100px 스코롤 되었다
window.addEventListener("scroll", () => {
    if (window.pageYOffset > 100 ) {
        totop.classList.add("active");
    } else {
        totop.classList.remove("active");
    }
})
*/
