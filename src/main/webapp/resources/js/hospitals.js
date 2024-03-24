  var slideIndex = 0;
  var slides = document.querySelectorAll('#slider img');
  var totalSlides = slides.length;

  function showSlide(index) {
    slides.forEach((slide, i) => {
      if (i === index) {
        slide.style.display = 'block';
      } else {
        slide.style.display = 'none';
      }
    });
  }

  function nextSlide() {
    slideIndex = (slideIndex === totalSlides - 1) ? 0 : slideIndex + 1;
    showSlide(slideIndex);
  }

  setInterval(nextSlide, 3000); // 3초마다 다음 슬라이드로 전환

  showSlide(slideIndex);