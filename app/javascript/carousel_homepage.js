// // // import { Controller } from "@hotwired/stimulus"

// // // export default class extends Controller {

// // //   connect() {
// // //     console.log("Hello from carousel_homepage.js")
// // //   }
// // // }
// // // // document.addEventListener("DOMContentLoaded", () => {
// // // //   const track = document.querySelector('.carousel-track');
// // // //   const slides = track ? Array.from(track.children) : [];
// // // //   const nextButton = document.querySelector('.next');
// // // //   const prevButton = document.querySelector('.prev');

// // // //   if (!track || slides.length === 0) {
// // // //       console.error("Carousel track or slides not found.");
// // // //       return;
// // // //   }

// // // //   let currentIndex = 0;

// // // //   function updateCarousel() {
// // // //       const slideWidth = slides[0].getBoundingClientRect().width;
// // // //       track.style.transform = `translateX(-${slideWidth * currentIndex}px)`;
// // // //   }

// // // //   nextButton.addEventListener('click', () => {
// // // //       if (currentIndex < slides.length - 1) {
// // // //           currentIndex++;
// // // //       } else {
// // // //           currentIndex = 0; // Loop back to start if at end
// // // //       }
// // // //       updateCarousel();
// // // //   });

// // // //   prevButton.addEventListener('click', () => {
// // // //       if (currentIndex > 0) {
// // // //           currentIndex--;
// // // //       } else {
// // // //           currentIndex = slides.length - 1; // Loop to end if at start
// // // //       }
// // // //       updateCarousel();
// // // //   });
// // // // });

// // import { Controller } from "@hotwired/stimulus";

// // export default class extends Controller {
// //   static targets = ["slide"]; // If you have any targets, declare them here

// //   connect() {
// //     console.log("Carousel Controller Connected!"); // Log message to confirm connection
// //     this.currentIndex = 0;
// //     this.showSlide(this.currentIndex);
// //   }

// //   next() {
// //     console.log("Next button clicked!"); // Log message when next is clicked
// //     this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length;
// //     this.showSlide(this.currentIndex);
// //   }

// //   prev() {
// //     console.log("Previous button clicked!"); // Log message when previous is clicked
// //     this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length;
// //     this.showSlide(this.currentIndex);
// //   }

// //   showSlide(index) {
// //     console.log("Showing slide:", index); // Log which slide is being shown
// //     this.slideTargets.forEach((slide, i) => {
// //       slide.style.display = i === index ? "block" : "none";
// //     });
// //   }
// // }


// document.addEventListener('DOMContentLoaded', function () {
//   console.log('DOMContentLoaded event fired'); // Debugging if turbo:load isn't working

//   const sections = document.querySelectorAll('.how-to-use-carousel');
//   console.log('Carousel found', sections.length); // To confirm if sections are selected

//   const options = {
//     root: null,
//     rootMargin: '0px',
//     threshold: 0.5
//   };

//   const observer = new IntersectionObserver(entries => {
//     entries.forEach(entry => {
//       if (entry.isIntersecting) {
//         console.log('Intersecting:', entry.target); // Debugging
//         entry.target.classList.add('visible');
//         observer.unobserve(entry.target);
//       }
//     });
//   }, options);

//   sections.forEach(section => {
//     console.log('Observing section:', section); // Debugging
//     observer.observe(section);
//   });
// });
