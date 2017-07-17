var https = require('https');
var querystring = require('querystring');
//var convertHex = require('convert-hex')

function request(post_data, cb){
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
  var post_req = https.request(post_options, function(res) {
      res.setEncoding('utf8');
      res.on('data', function (chunk) {
          //console.log('Response: ' + chunk);
          cb(chunk);
      });
  });
  return post_req;
}
function get(stream, count, bID, cb){
  // An object of options to indicate where to post to
   var post_options = {
       host: 'cmuh2yqymk.execute-api.eu-west-2.amazonaws.com',
       port: '443',
       path: '/test/bb/vote',
       method: 'GET',
       headers: {
             'x-api-key': 'jggxdab6Db2fmekSpJXWY56O9Uz1lzq69NDj4Dk2',
             'stream': stream,
             'count': count,
             'txid': bID
         }
   };

  var post_res = https.get(post_options, function(res){
    res.on('data', function (chunk){
      cb(chunk);
    })
  })
  return post_res;
}

function castVote(decision, cb){
  var post_data = {
      'datetime' : new Date().toISOString(),
      'decision': decision
  };

  var post_data = JSON.stringify(post_data);

  var post_req = request(post_data, cb);

  // post the data
  post_req.write(post_data);
  post_req.end();
}


function getVote(stream, blockid, cb){
  //var headers = ", 'stream': " + stream +"', 'count': '0', 'txid': '" + blockid + "'";
  var headers = {
    stream : stream,
    count: 1,
    txid: blockid
  };
  //console.log(headers);
  var post_req = get(stream, 1, blockid, cb);

  // post the data
  post_req.on('error', (e) => {
  console.error(e);
  });
  post_req.end();
}


function getResults(election){
  return "dom sucks";
}

// castVote("party", function (cb)
// {
//     console.log(cb);
// });

// getVote("july-2017", "51b3192af96472d6d525e3bd46e3e81b3c61a7d86bcd03fac638c9124a0f5c3b",function (cb)
// {
//   console.log(cb);
//   var hex = cb.toString();
//   console.log(hex);
//   var hexData = cb.toString('utf8').toString('utf8');
//   console.log(hexData);
//
// });
 module.exports = {
     getVote: getVote,
     castVote: castVote,
     getResults: getResults
 }
