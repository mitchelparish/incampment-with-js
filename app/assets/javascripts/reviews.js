$(function () {
  console.log('reviews.js is loaded...')
  listenForReviewsClick()
});


function listenForReviewsClick() {
  $('.get-reviews').on('click', function(event) {
    event.preventDefault();
    getReviews();
  });
};


function getReviews() {
  $.ajax({
    url: 'http://localhost:3000/reviews',
    method: 'get',
    dataType: 'json',
    success: function(data){
      console.log("The data is: ", data)
      data.map(review => {

        let newReview =  new Review(review)

        let newReviewHtml = newReview.postHtml()

          document.getElementById('reviews').innerHTML += newReviewHtml
          debugger
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
      <p>${this.rating}
      ${this.comments}</p>
    </div>
  `)
}
