// import { Application } from "@hotwired/stimulus"

// const application = Application.start()

// // Configure Stimulus development experience
// application.debug = false
// window.Stimulus   = application

// export { application }


import { Application } from "@hotwired/stimulus";
import CarouselController from "./controllers/carousel_controller";

const application = Application.start();
application.register("carousel", CarouselController);

// import { Application } from "stimulus";
// import CarouselController from "./carousel_controller"; // Ensure correct path
// const application = Application.start();
// application.register("carousel", CarouselController);
