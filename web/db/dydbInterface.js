var AWS = require("aws-sdk");
var key = require('../db/keyTools.js');
var crypto = require('crypto');
var keypair = require('keypair');
var StringDecoder = require('string_decoder').StringDecoder;

//http://docs.aws.amazon.com/amazondynamodb/latest/gettingstartedguide/GettingStarted.NodeJs.03.html


AWS.config.update({
  region: "eu-west-2",
  endpoint: "dynamodb.eu-west-2.amazonaws.com"
});

var docClient = new AWS.DynamoDB.DocumentClient();

// insertNode("TEST-1", "127.0.0.0", "rpcuser", "todo", "client", "aws");
// var address = {line1: "line1", line2: "line2", postcode:"aa11 1aa"}
// insertUser("0", "key", "pass", "test", address)

function login(passphrase, username, privateKey){
  var data = getUser(username, function(cb) {
    //var kPair = key.generateKeyPair("test");
    var shasum = crypto.createHash('sha256');
    console.log("before:" + passphrase);
    var pass = key.encryptStringWithPrivateKey(passphrase, privateKey);
    console.log("mid:" + pass);
    //var pass  = key.decryptStringWithPublicKey(passphrase, cb.Item.pub_key);
    pass  = key.decryptStringWithPublicKey(pass, cb.Item.pub_key);
    console.log("after:" + pass);
    var hash = crypto.createHash('sha1');
    var hashed = shasum.digest("pass");
    return (hashed == cb.Item.passphrase);
  });
}

//login("blockbusters", "10");

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
exports.helloWorld = function helloWorld(){
  return "hello world";
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
function getUser(userID, cb){
  var table = "block_users";
  var params = {
      TableName:table,
      Key:{
          "user_id": userID
      }
  };
  var data = get(params, cb);
  return data;
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
        //console.log("Scan: ", JSON.stringify(data, null, 2));
        var maxID = 0;
        for (var i = 0; i < data.Items.length; i++) {
          maxID = (data.Items[i].user_id > maxID ? data.Items[i].user_id : maxID);
        }
        console.log("top id:  " + maxID);
        callback(String(Number(maxID) + 1));
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

function get(params, cb){
  console.log("Getting a item...");
  docClient.get(params, function(err, data) {
      if (err) {
          console.error("Unable to get item. Error JSON:", JSON.stringify(err, null, 2));
          cb(err);
      } else {
          console.log("Got item:", JSON.stringify(data, null, 2));
          cb(data);
      }
  });
}
