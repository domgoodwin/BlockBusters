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

exports.Login = function login(userID, pass, cb){
  var table = "block_users";
  var params = {
      TableName : table,
      KeyConditionExpression: "#uid = :uid",
      ExpressionAttributeNames:{
          "#uid": "user_id"
      },
      ExpressionAttributeValues: {
          ":uid":"1"
      }
  };

  docClient.query(params, function(err, data) {
      if (err) {
          console.log("Unable to query. Error:", JSON.stringify(err, null, 2));
      } else {
          console.log("Query succeeded.");
          data.Items.forEach(function(item) {
              console.log(item.user_id + ": " + item.passphrase);
              var rsa = new chilkat.Rsa();
          });
      }
  });
}

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
exports.GetUser = function getUser(userID){
  var table = "block_users";
  var params = {
      TableName:table,
      Key:{
          "user_id": "0" // TODO get ID from next one
      }
  };
  get(params);
}

exports.GetNextUserID = function getNextID(callback){
  var table = "block_users";
  var params = {
      TableName: table
  };
  docClient.scan(params, function(err, data){
    if (err) {
        console.error("Scan error:", JSON.stringify(err, null, 2));
        callback(err);
    } else {
        console.log("Scan: ", JSON.stringify(data, null, 2));
        var maxID = 0;
        for (var i = 0; i < data.Items.length; i++) {
          maxID = (data.Items[i].user_id > maxID ? data.Items[i].user_id : maxID);
        }
        console.log("top id:  " + maxID);
        callback(Number(maxID) + 1);
    }
  })
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

function get(params){
  console.log("Getting a item...");
  docClient.get(params, function(err, data) {
      if (err) {
          console.error("Unable to get item. Error JSON:", JSON.stringify(err, null, 2));
      } else {
          console.log("Got item:", JSON.stringify(data, null, 2));
      }
  });
}
