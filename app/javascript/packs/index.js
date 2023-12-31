window.addEventListener("load" , () => {
    var read_status = document.getElementById('read_status');
    var read_req = document.getElementById('read_req');
    var new_post_req = document.getElementById('new_post_req');
    const posts = document.querySelectorAll('.post');
    var token = document.querySelector('meta[name="csrf-token"]').content

    posts.forEach((post) => {
        post.addEventListener('click' , () =>{
            console.log("Post clicked!");
            const post_id = post.getAttribute('data-post-id');
            const topic_id = post.getAttribute('data-topic-id');
            const user_id = post.getAttribute('data-user-id');

            // sending request
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                console.log(xmlhttp);
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        if (read_status.innerText === "Unread") {
                            read_status.innerText = "Read";
                            alert('You read the post')
                        }
                    } else {
                        alert(xmlhttp.status);
                        alert('There was error');
                    }
                }
            }
            xmlhttp.open('POST', '/change_read_status' , true);
            xmlhttp.setRequestHeader('Content-Type', 'application/json');
            let data = {id: post_id, topic_id: topic_id, user_id: user_id};
            xmlhttp.setRequestHeader('X-CSRF-Token',token);
            xmlhttp.send(JSON.stringify(data));

        });
    });


});