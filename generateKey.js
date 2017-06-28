var crypto = require('crypto');

var prime_length = 256;
var diffHell = crypto.createDiffieHellman(prime_length);
var privateKey;
var publicKey;

diffHell.generateKeys('base64');
console.log("Public Key : " ,diffHell.getPublicKey('base64'));
console.log("Private Key : " ,diffHell.getPrivateKey('base64'));
var privateKey = diffHell.getPrivateKey('base64');
var publicKey = diffHell.getPrivateKey('base64');
var buf = Buffer.from("Hello", 'utf8');

var cryptedData = crypto.privateEncrypt(privateKey, buf);

console.log("Public Key : " ,diffHell.getPublicKey('hex'));
console.log("Private Key : " ,diffHell.getPrivateKey('hex'));
