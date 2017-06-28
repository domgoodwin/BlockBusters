var crypto = require('crypto');

var prime_length = 256;
var diffHell = crypto.createDiffieHellman(prime_length);
var privateKey;
var publicKey;

diffHell.generateKeys('base64');


function encrypt(key, data) {
        var cipher = crypto.createCipher('aes-256-cbc', key);
        var crypted = cipher.update(text, 'utf-8', 'hex');
        crypted += cipher.final('hex');

        return crypted;
}

function decrypt(key, data) {
        var decipher = crypto.createDecipher('aes-256-cbc', key);
        var decrypted = decipher.update(data, 'hex', 'utf-8');
        decrypted += decipher.final('utf-8');

        return decrypted;
}

var publicKey = diffHell.getPublicKey('base64');
var privateKey = diffHell.getPrivateKey('base64');
var text = "\nOlivia Minshall";
console.log("\nOriginal Text: " + text);
console.log("\nPublic key: " + publicKey);
console.log("\nPrivate key: " + privateKey);
var encryptedText = encrypt(publicKey, text);
console.log("\nPublic key encrypted Text: " + encryptedText);
var decryptedText = decrypt(publicKey, encryptedText);
console.log("Public key decrypted Text: " + decryptedText);
