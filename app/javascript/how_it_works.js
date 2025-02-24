// document.addEventListener('DOMContentLoaded', function () {
//   console.log('DOMContentLoaded event fired'); // Debugging if turbo:load isn't working

//   const sections = document.querySelectorAll('.feature-section');
//   console.log('Feature sections found:', sections.length); // To confirm if sections are selected

//   const observer = new IntersectionObserver(entries => {
//     entries.forEach(entry => {
//       if (entry.isIntersecting) {
//         console.log('Intersecting:', entry.target); // Debugging
//         entry.target.classList.add('visible');
//         observer.unobserve(entry.target);
//       }
//     });
//   });

//   sections.forEach(section => {
//     console.log('Observing section:', section); // Debugging
//     observer.observe(section);
//   });
// });

document.addEventListener('DOMContentLoaded', function () {
  console.log('DOMContentLoaded event fired'); // Debugging if turbo:load isn't working

  const sections = document.querySelectorAll('.feature-section');
  console.log('Feature sections found:', sections.length); // To confirm if sections are selected

  const options = {
    root: null,
    rootMargin: '0px',
    threshold: 0.5
  };

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        console.log('Intersecting:', entry.target); // Debugging
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, options);

  sections.forEach(section => {
    console.log('Observing section:', section); // Debugging
    observer.observe(section);
  });
});

