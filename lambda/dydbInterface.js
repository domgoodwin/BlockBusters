var AWS = require("aws-sdk");

//http://docs.aws.amazon.com/amazondynamodb/latest/gettingstartedguide/GettingStarted.NodeJs.03.html

AWS.config.update({
  region: "eu-west-2",
  endpoint: "dynamodb.eu-west-2.amazonaws.com"
});

var docClient = new AWS.DynamoDB.DocumentClient();

insertNode("TEST-1", "127.0.0.0", "rpcuser", "todo", "client", "aws");

function insertNode(nodeID, pubIP, rpcuser, rpcpass, type, host, status){
  var table = "block_nodes";
  var params = {
      TableName:table,
      Item:{
          "node_id": nodeID,
          "pub_ip": pubIP,
          "rpc":{
              "user": rpcuser,
              "pass": rpcpass
          },
          "type": type,
          "hostname" : host,
          "status" : status
      }
  };
  insert(params);
}
function insertUser(userID, pubKey, pass){
  var table = "block_users";
  var params = {
      TableName:table,
      Item:{
          "user_id": nodeID, // TODO get ID from next one
          "pub_key": pubKey,
          "passphrase": pass
      }
  };
  insert(params);
}


function insert(params){
  console.log("Adding a new item...");
  docClient.put(params, function(err, data) {
      if (err) {
          console.error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2));
      } else {
          console.log("Added item:", JSON.stringify(data, null, 2));
      }
  });
}
