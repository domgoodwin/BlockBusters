var AWS = require("aws-sdk");

//http://docs.aws.amazon.com/amazondynamodb/latest/gettingstartedguide/GettingStarted.NodeJs.03.html


AWS.config.update({
  region: "eu-west-2",
  endpoint: "dynamodb.eu-west-2.amazonaws.com"
});

var docClient = new AWS.DynamoDB.DocumentClient();

// insertNode("TEST-1", "127.0.0.0", "rpcuser", "todo", "client", "aws");
// var address = {line1: "line1", line2: "line2", postcode:"aa11 1aa"}
// insertUser("0", "key", "pass", "test", address)

exports.InsertNode = function insertNode(nodeID, pubIP, rpcuser, rpcpass, type, host, status){
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
exports.InsertUser = function insertUser(userID, pubKey, pass, name, address){
  var table = "block_users";
  var params = {
      TableName:table,
      Item:{
          "user_id": userID, // TODO get ID from next one
          "pub_key": pubKey,
          "passphrase": pass,
          "name": name,
          "address": address
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
