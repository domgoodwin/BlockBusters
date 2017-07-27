var rpc = require('node-json-rpc');
getInfo();
exports.handler = (event, context, callback) => {
    //var rpcuser = process.env.rpcuser;
    getInfo();
    callback(null, 'Hello from Lambda, user:');
};
function getInfo(){
  var options = {
    // int port of rpc server, default 5080 for http or 5433 for https
    port: 6720,
    // string domain name or ip of rpc server, default '127.0.0.1'
    host: '35.176.80.201',
    login: 'multichainrpc',
    hash: '9efhFzXvdmKHKvM9xX3xwz7i8aTapArgmhfbWNQA6bRG'
  };

  var client = new rpc.Client(options);

  //   {"jsonrpc": "2.0", "method": "getblockchainparams", "params": [1,2], "id": 0},

  client.call(
    {"jsonrpc": "2.0", "method": "getinfo", "params": [], "id": 0 },
    function (err, res){
      console.log("in func");
      if (err) {console.log(err + ":" + res.error.message);}
      else {console.log(res);}
    }
  );
}
