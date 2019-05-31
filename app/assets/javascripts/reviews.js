// Verify .js file has loaded.

$(function () {
  console.log('reviews.js successfully loaded.');
});

// Render Camp reviews upon user click

let reviewSelector = document.querySelector('#get-reviews');

reviewSelector.addEventListener('click', function(event){
 	event.preventDefault();
  getReviews();
}, {once : true});

function getReviews() {
  $.ajax({
    url: `http://localhost:3000/camps/${document.querySelector('#camp-name').dataset.id}/reviews`,
    method: 'get',
    dataType: 'json',
    success: function(data){
      data.map(review => {
        let newReview =  new Review(review);
        let newReviewHtml = newReview.postHtml();
        document.getElementById('reviews').innerHTML += newReviewHtml;
      }
    )}
  })
}

class Review {
  constructor(obj) {
    this.rating = obj.rating;
    this.comments = obj.comments;
    this.user_id = obj.user_id;
    this.camp_id = obj.camp_id;
    this.created_at = obj.created_at;
    this.updated_at = obj.updated_at;
  }
}

Review.prototype.postHtml = function() {
  return (`
    <div class="reviews">
      <p>
        Rating: ${this.rating}<br>
        ${this.comments}
      </p>
    </div>
  `)
}

// Handle form submission and dynamic posting to DOM

$(function () {
   $('form').submit(function(event) {
     event.preventDefault();

     if(validateForm()) {
       if($('.reviews').length <= 1){
         getReviews();
       }
       let values = $(this).serialize();
       let posting = $.post(`/camps/${document.querySelector('#camp-name').dataset.id}/reviews`, values);

       posting.done(function(data) {
         let newReviewData = new Review(data);
         let newReviewDataHtml = newReviewData.postHtml();
         document.getElementById('reviews').innerHTML += newReviewDataHtml;
       });
       $('form')[0].reset()
       return false
     }
   });
});

// Client-side form validation

function validateForm() {
  const rating = document.getElementById('rating').value;
  const comments = document.getElementById('comments').value;

  if (rating == '' || comments == '') {
    alert('All fields are required.');
    return false;
  } else {
      return true;
    }
  }
