var http = require('https');
var querystring = require('querystring');

// Build the post string from an object
var post_data = {
    'user' : 'janMichael',
    'decision': 'party1'
};

var post_data = JSON.stringify(post_data);

// An object of options to indicate where to post to
 var post_options = {
     host: 'cmuh2yqymk.execute-api.eu-west-2.amazonaws.com',
     port: '443',
     path: '/test/bb/vote',
     method: 'POST',
     headers: {
         'Content-Type': 'application/json',
         'Content-Length': Buffer.byteLength(post_data),
         'x-api-key': 'jggxdab6Db2fmekSpJXWY56O9Uz1lzq69NDj4Dk2'
     }
 };

 // Set up the request
 var post_req = http.request(post_options, function(res) {
     res.setEncoding('utf8');
     res.on('data', function (chunk) {
         console.log('Response: ' + chunk);
     });
 });

 // post the data
 post_req.write(post_data);
 post_req.end();
