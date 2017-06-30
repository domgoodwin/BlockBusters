exports.handler = (event, context, callback) => {
    //var rpcuser = process.env.rpcuser;
    GetVote(event.headers.stream, callback);
};

let multichain = require("multichain-node")({
    port: 6720,//process.env.port,
    host: "35.176.80.201",//process.env.host,
    user: "multichainrpc",
    pass: "9efhFzXvdmKHKvM9xX3xwz7i8aTapArgmhfbWNQA6bRG"//process.env.pass
  });

GetVote("stream1", null);

function GetVote(stream, cb){
  //var hexID = new Buffer(txid).toString("hex");
  multichain.listStreamItems({stream: stream, "verbose": false}, (err, res) => {
    var datas = [];
    if(err){
      console.log(err);
      //cb(null, 'Get error: ' + JSON.stringify(err) + count);
    }
    else{
      var array = JSON.parse(res);
      console.log(JSON.stringify(res));
      for (var i = 0; i < array.length; i++) {
        datas.push(hex2a(array[i].data));
        console.log(hex2a(array[i].data));
      }
    }
  })
}

function hex2a(hexx) {
    var hex = hexx.toString();//force conversion
    var str = '';
    for (var i = 0; i < hex.length; i += 2)
        str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
    return str;
}
