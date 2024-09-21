/*=============== SHOW MENU ===============*/
const navMenu = document.getElementById('nav-menu'),
      navToggle = document.getElementById('nav-toggle'),
      navClose = document.getElementById('nav-close')

/* Menu show */
if(navToggle){
   navToggle.addEventListener('click', () =>{
      navMenu.classList.add('show-menu')
   })
}

/* Menu hidden */
if(navClose){
   navClose.addEventListener('click', () =>{
      navMenu.classList.remove('show-menu')
   })
}

// toggle the dropdown menu visibility
document.querySelectorAll('.custom-dropbox i').forEach(icon => {
   icon.addEventListener('click', function() {
      const menu = this.nextElementSibling;
      menu.classList.toggle('show');
   });
});

// testimonial 
let currentTestimonial = 0;
const testimonials = document.querySelectorAll('.testimonial-item');

function showTestimonial(index) {
    testimonials.forEach((testimonial, i) => {
        testimonial.style.display = i === index ? 'block' : 'none';
    });
}

function nextTestimonial() {
    currentTestimonial = (currentTestimonial + 1) % testimonials.length;
    showTestimonial(currentTestimonial);
}

function prevTestimonial() {
    currentTestimonial = (currentTestimonial - 1 + testimonials.length) % testimonials.length;
    showTestimonial(currentTestimonial);
}

// Initialize the first testimonial
showTestimonial(currentTestimonial);

// Keyboard navigation
document.addEventListener('keydown', function(event) {
    if (event.key === 'ArrowRight') {
        nextTestimonial();
    } else if (event.key === 'ArrowLeft') {
        prevTestimonial();
    }
});
