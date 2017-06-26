
exports.handler = (event, context, callback) => {
    //var rpcuser = process.env.rpcuser;
    PublishVote(process.env.stream, event.data, callback);
};

let multichain = require("multichain-node")({
    port: process.env.port,
    host: process.env.host,
    user: "multichainrpc",
    pass: process.env.pass
  });

function PublishVote(stream, data, cb){
  var hexData = new Buffer(data).toString("hex");
  multichain.publish({stream: stream, key: "0", data: hexData}, (err, res) => {
    if(err){
      console.log(err);
      cb(null, 'Create error: ' + err);
    }
    else{
      console.log("BLOCKCREATE: " + res);
      cb(null, 'Block created: ' + res);
    }
  })
}
