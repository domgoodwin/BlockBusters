let multichain = require("multichain-node")({
//REDACTED
});



//PublishVote("stream1", "data");
//GetVotes("stream1");
//Grant("1CBJVkn51gidqyqj3PHByi56Cy6pXgvJJ4krUs", "connect");
module.exports = {
  function GetInfo(){
    multichain.getInfo((err, info) => {
        if(err){
            throw err;
        }
        console.log(info);
    })
  }

  function PublishVote(stream, data){
    var hexData = new Buffer(data).toString("hex");
    multichain.publish({stream: stream, key: "0", data: hexData}, (err, res) => {
      if(err){
        console.log(err);
        return err;
      }
      else{
        console.log("Block created with ID: " + res);
        return res;
      }
    })
  }

  function GetVotes(stream){
    multichain.listStreamItems({stream: stream, verbose: false}, (err, res) => {
      if(err){
        console.log(err);
        return err;
      }
      else{
        console.log("STREAM ITEMS: " + JSON.stringify(res));
        return res;
      }
    })
  }

  function Grant(address, permissions){
    multichain.grant({addresses: address, permissions: permissions}, (err, res) => {
      if(err){
        console.log(err);
        return err;
      }
      else{
        console.log("GRANT OUT: " + res);
        return res;
      }
    })
  }

}
