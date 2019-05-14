$(function () {
  console.log('camps.js is loaded...')
  listenForClick()
});




function listenForClick() {
  $('.review').on('click', function(event) {

    alert('Is it working?')
  })
}
