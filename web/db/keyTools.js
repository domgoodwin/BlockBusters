//for string encrypt/decrypt
var crypto = require("crypto");
//for saving/reading to file
var path = require("path");
var fs = require("fs");
//for genraing the keys
var keypair = require('keypair');

var encryptStringWithPrivateKey = function(toEncrypt, privKey) {
    //var absolutePath = path.resolve(pubKey);
    //var publicKey = fs.readFileSync(absolutePath, "utf8");
    var buffer = new Buffer(toEncrypt);
    var encrypted = crypto.privateEncrypt(privKey, buffer);
    return encrypted.toString("base64");
};

var decryptStringWithPublicKey = function(toDecrypt, pubKey) {
    //var absolutePath = path.resolve(privKey);
    //var privateKey = fs.readFileSync(absolutePath, "utf8");
    var buffer = new Buffer(toDecrypt, "base64");
    var decrypted = crypto.publicDecrypt(pubKey, buffer);
    return decrypted.toString("utf8");
};

var generateKeyPair = function(pairName){
  var pair = keypair();
  console.log(pair);
  return pair;
  //var fp = path.join(__dirname, '..', 'tmp', pairName);
  //public key
  //saveToFile(pair.public, fp + ".pub");
  //priv key
  //saveToFile(pair.private, fp);
};

var saveToFile = function(key, filePath){
  fs.writeFile(filePath, key, function(err) {
    if(err) {
        return console.log(err);
    }
    console.log("Key saved");
  });
};

module.exports = {
    encryptStringWithPrivateKey: encryptStringWithPrivateKey,
    decryptStringWithPublicKey: decryptStringWithPublicKey,
    generateKeyPair: generateKeyPair
}

//generateKeyPair("test1");
 //var enTx = encryptStringWithRsaPublicKey("test", path.join(__dirname, '..', 'tmp', 'pairName.pub'));
 //console.log(enTx);
 //console.log(decryptStringWithRsaPrivateKey(enTx, path.join(__dirname, '..', 'tmp', 'pairName')));
