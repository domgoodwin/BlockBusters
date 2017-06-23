var rpc = require('node-json-rpc');

exports.handler = (event, context, callback) => {
    var rpcuser = process.env.rpcuser;
    callback(null, 'Hello from Lambda, user: ' + rpcuser);
};


function setup(){
  // Get API auth details
  var rpcpassword = process.env.rpcpassword;
  var options = {
    // int port of rpc server, default 5080 for http or 5433 for https
    port: process.env.rpcport,
    // string domain name or ip of rpc server, default '127.0.0.1'
    host: process.env.rpchost,
    // string with default path, default '/'
    path: '/',
    // boolean false to turn rpc checks off, default true
    strict: true
  };

  console.log(rpcuser);
}
