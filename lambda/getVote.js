
exports.handler = (event, context, callback) => {
    //var rpcuser = process.env.rpcuser;
    var count = (event.headers.count == 'undefined' ? 0 : event.headers.count);
    var txid = (event.headers.txid == 'undefined' ? "0" : event.headers.txid);
    GetVote(event.headers.stream, txid, count, callback);
};

let multichain = require("multichain-node")({
    port: process.env.port,
    host: process.env.host,
    user: "multichainrpc",
    pass: process.env.pass
  });

function GetVote(stream, txid, count, cb){
  //var hexID = new Buffer(txid).toString("hex");
  console.log(stream);
  if(count < 2 && txid != "0"){
    multichain.getStreamItem({stream: stream, txid: txid, "verbose": false}, (err, res) => {
      if(err){
        console.log(err);
        cb(null, 'Get error: ' + JSON.stringify(err));
      }
      else{
        console.log("BLOCKDATA: " + res.data);
        cb(null, 'Block data: ' + res.data);
      }
    })
  } else{
    multichain.listStreamItems({stream: stream, count: count, "verbose": false}, (err, res) => {
      if(err){
        console.log(err);
        cb(null, 'Get error: ' + JSON.stringify(err) + count);
      }
      else{
        console.log("BLOCKDATA: " + JSON.stringify(res));
        cb(null, 'Block data: ' + JSON.stringify(res));
      }
    })
  }


}
