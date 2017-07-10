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

//  Start with a new RSA object to demonstrate that all we
 //  need are the keys previously exported:
 var rsaEncryptor = new chilkat.Rsa();
 var rsa = new chilkat.Rsa();
 //  Encrypted output is always binary.  In this case, we want
 //  to encode the encrypted bytes in a printable string.
 //  Our choices are "hex", "base64", "url", "quoted-printable".
 rsaEncryptor.EncodingMode = "hex";

 //  We'll encrypt with the public key and decrypt with the private
 //  key.  It's also possible to do the reverse.
 rsa.getPrivateKey()
 success = rsaEncryptor.ImportPrivateKey(privatekey);
 var usePrivateKey = false;
 var encryptedStr = rsaEncryptor.EncryptStringENC(plainText,usePrivateKey);
 console.log(encryptedStr);
