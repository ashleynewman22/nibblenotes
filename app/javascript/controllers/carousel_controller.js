// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["slide"];

//   connect() {
//     this.currentIndex = 0;
//     this.showSlide(this.currentIndex);
//   }

//   next() {
//     this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length;
//     this.showSlide(this.currentIndex);
//   }

//   prev() {
//     this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length;
//     this.showSlide(this.currentIndex);
//   }

//   showSlide(index) {
//     this.slideTargets.forEach((slide, i) => {
//       slide.style.display = i === index ? "block" : "none";
//     });
//   }
// }


// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["slide"]; // Target all .carousel-slide elements

//   connect() {
//     this.currentIndex = 0;
//     this.showSlide(this.currentIndex);
//   }

//   // Show the next slide
//   next() {
//     this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length; // Loop back to first slide
//     this.showSlide(this.currentIndex);
//   }

//   // Show the previous slide
//   prev() {
//     this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length; // Loop back to last slide
//     this.showSlide(this.currentIndex);
//   }

//   // Show the slide based on the index
//   showSlide(index) {
//     // Hide all slides
//     this.slideTargets.forEach((slide, i) => {
//       slide.style.display = i === index ? "block" : "none"; // Show only the current slide
//     });
//   }
// }

// CODE WITH BUTTONS AND TO CHECK WITH MESSAGE
// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["slide"]; // If you have any targets, declare them here

//   connect() {
//     console.log("Carousel Controller Connected!"); // Log message to confirm connection
//     this.currentIndex = 0;
//     this.showSlide(this.currentIndex);
//   }

//   next() {
//     console.log("Next button clicked!"); // Log message when next is clicked
//     this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length;
//     this.showSlide(this.currentIndex);
//   }

//   prev() {
//     console.log("Previous button clicked!"); // Log message when previous is clicked
//     this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length;
//     this.showSlide(this.currentIndex);
//   }

//   showSlide(index) {
//     console.log("Showing slide:", index); // Log which slide is being shown
//     this.slideTargets.forEach((slide, i) => {
//       slide.style.display = i === index ? "block" : "none";
//     });
//   }
// }

// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     console.log("Carousel Controller Connected!"); // Log message to confirm the controller is connected
//   }
// }
