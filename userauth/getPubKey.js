var os = require('os');
if (os.platform() == 'win32') {
    var chilkat = require('chilkat_node6_win32');
} else if (os.platform() == 'linux') {
    if (os.arch() == 'arm') {
        var chilkat = require('chilkat_node6_arm');
    } else if (os.arch() == 'x86') {
        var chilkat = require('chilkat_node6_linux32');
    } else {
        var chilkat = require('chilkat_node6_linux64');
    }
} else if (os.platform() == 'darwin') {
    var chilkat = require('chilkat_node6_macosx');
}

function encryptPassphrase($passphrase) {

    var rsa = new chilkat.Rsa();

    var success = rsa.UnlockComponent("Anything for 30-day trial");
    if (success !== true) {
        console.log("RSA component unlock failed");
        return;
    }

    //  Generate a 1024-bit key.  Chilkat RSA supports
    //  key sizes ranging from 512 bits to 4096 bits.
    success = rsa.GenerateKey(1024);
    if (success !== true) {
        console.log(rsa.LastErrorText);
        return;
    }

    //  Keys are exported in XML format:
    var publicKey = rsa.ExportPublicKey();
    var privateKey = rsa.ExportPrivateKey();

    var plainText = $passphrase;
    //console.log("Original plain text: " + $passphrase);
    console.log("public key: " + publicKey);
    console.log("private key: " + privateKey);
    //  Start with a new RSA object to demonstrate that all we
    //  need are the keys previously exported:
    var rsaEncryptor = new chilkat.Rsa();

    //  Encrypted output is always binary.  In this case, we want
    //  to encode the encrypted bytes in a printable string.
    //  Our choices are "hex", "base64", "url", "quoted-printable".
    rsaEncryptor.EncodingMode = "hex";

    //  We'll encrypt with the public key and decrypt with the private
    //  key.  It's also possible to do the reverse.
    success = rsaEncryptor.ImportPublicKey(publicKey);

    var usePrivateKey = false;
    var encryptedStr = rsaEncryptor.EncryptStringENC(plainText,usePrivateKey);
    //console.log("\nEncrypted text using public key: " + encryptedStr);

}

encryptPassphrase("Olivia");
