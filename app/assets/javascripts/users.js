$(function () {
  console.log('users.js successfully loaded.')
});

let userSelector = document.querySelector('.user');

userSelector.addEventListener('click', function(event){
 	event.preventDefault();
  getUser();
}, {once : true});  // remove once : true once completed

function getUser() {
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
    this.camps = obj.camps.forEach(function (camp) {
      console.log(camp.name);
      console.log(camp.state);
    })

  }
}


User.prototype.postHtml = function() {
  return (`
    <div id="main">
      <p>
        <br>
        User: ${this.username}<br>
        Member Since: ${this.created_at}<br><br>
        Camps Visited:<br> ${this.camps}
      </p>
    </div>
  `)
}
