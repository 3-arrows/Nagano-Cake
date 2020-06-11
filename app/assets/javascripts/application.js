// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require jquery.jpostal
//= require_tree .

// 郵便番号で住所検索機能
$(function() {
  $(document).on('turbolinks:load', () => {
    $('#member_postal_code').jpostal({
      postcode : [
        '#member_postal_code'
      ],
      address: {
        "#member_prefecture_code": "%3", // # 都道府県が入力される
        "#member_city"           : "%4%5", // # 市区町村と町域が入力される
        "#member_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#destination_postal_code').jpostal({
      postcode : [
        '#destination_postal_code'
      ],
      address: {
        "#destination_prefecture_code": "%3", // # 都道府県が入力される
        "#destination_city"           : "%4%5", // # 市区町村と町域が入力される
        "#destination_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#order_postal_code').jpostal({
      postcode : [
        '#order_postal_code'
      ],
      address: {
        "#order_prefecture_code": "%3", // # 都道府県が入力される
        "#order_city"           : "%4%5", // # 市区町村と町域が入力される
        "#order_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});