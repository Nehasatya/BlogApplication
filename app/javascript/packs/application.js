// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Javascript
// window.addEventListener("load" , () => {
//     var read_status = document.getElementById('read_status');
//     var read_req = document.getElementById('read_req');
//     read_req.addEventListener("ajax:success" , (event) => {
//         const [_data, _status, xhr] = event.detail;
// //        var post_id = <%#= @jsonData.to_s.html_safe %>;
// //        var post = <%# Post.find_by(id:post_id)%>
//         var status = xhr.responseText;
//         fail
//         <% change_read_status(current_user, post) %>
//         read_status.innerText = <%= check_user_read_status(current_user,post) %>
//     });
// });
//
// var read_status = document.getElementById('read_post')
// read_status.addEventListener("click",change_status)
// function change_status() {
//     var xhttp = new XMLHttpRequest();
//     xhttp.onreadystatechange = function() {
//         // if (this.readyState == 4 && this.status == 200) {
//             var read = document.createElement("Read")
//             document.getElementById("read_status").appendChild(read);
//         // }
//     };
//     xhttp.open("GET", "/topics/1/posts", true);
//     xhttp.send();
// }