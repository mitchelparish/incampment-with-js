// Verify .js file has loaded.

$(function () {
  console.log('users.js successfully loaded.')
});

let userSelector = document.querySelector('.user');

userSelector.addEventListener('click', function(event){
 	event.preventDefault();
  getUser();
});

function getUser() {
  changeURL();
  $.ajax({
    url: `http://localhost:3000/profile`,
    method: 'get',
    dataType: 'json',
    success: function(data){
      let newUser =  new User(data)
      let newUserHtml = newUser.postHtml()
        document.getElementById('main').innerHTML = newUserHtml
      }
    })
  }

class User {
  constructor(obj) {
    this.id = obj.id
    this.username = obj.username
    this.created_at = obj.created_at
    this.camps = obj.camps
  }
}

User.prototype.postHtml = function() {
  return (`
    <div id="main">
      <p>
        <br>
        User: ${this.username}<br>
        Member Since: ${this.created_at}<br><br>
        Places You've Been:<br> ${this.camps.map(camp => `<li>${camp.name}</li>`)}
      </p>
    </div>
  `)
}

function changeURL() {
  let stateObj = {
    user: "profile",
  };

  history.pushState(stateObj, "", "/profile");
}
