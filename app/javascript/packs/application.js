// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./add_jquery"

//= require jquery3
// = require jquery_ujs
// = require_tree


Rails.start()
Turbolinks.start()
ActiveStorage.start()



window.document.addEventListener('ajax:beforeSend', () => {
    // alert("beforeSend");
    spinner.style.display = 'block'
})

document.addEventListener('ajax:complete', (event) => {
    // alert("ajax:complete");
    spinner.style.display = 'none'
})