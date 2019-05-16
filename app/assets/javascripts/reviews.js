$(function () {
  console.log('reviews.js successfully loaded.')
  // listenForReviewsClick()
});

// function listenForReviewsClick() {
//   $('.get-reviews').on('click', function(event) {
//     event.preventDefault();
//     getReviews();
//     });
// };


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
        let newReview =  new Review(review)
        let newReviewHtml = newReview.postHtml()
        document.getElementById('reviews').innerHTML += newReviewHtml
      }
    )}
  })
}

// function getReviews() {
//   fetch('http://localhost:3000/reviews')
//   .then(res => res.json())
//   .then(data => {
//     debugger
//     const review = new Review(data.message)
//     const reviewHTML = review.postHtml()
//     document.getElementById('reviews').innerHTML = reviewHTML
//   })
// }





let leaveReviewSelector = document.querySelector('#post-review');

leaveReviewSelector.addEventListener('click', function(event){
  event.preventDefault();
  postReview();
}, {once: true});

function postReview() {

}



class Review {
  constructor(obj) {
    this.rating = obj.rating
    this.comments = obj.comments
    this.user_id = obj.user_id
    this.camp_id = obj.camp_id
    this.created_at = obj.created_at
    this.updated_at = obj.updated_at
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
