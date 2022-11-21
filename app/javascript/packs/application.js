// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

var userForm = document.querySelector("#userForm");

// userNameのフォームに値を入力（もしくは削除）した時に発火するイベント
userName.addEventListener('input', ()=>{
  // イベント発火時の処理
});

//= require jquery
//= require jquery_ujs

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

// $(function(){
//   // ①submit()に関数をバインド
//   $('form').submit(function() {
//     let word = $("input[name='word']").val()
//     if(word == ""){

//       alert("空です");
//       return false;

//     }

//   });

// });