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

function encrypt(passphrase, xmlPrivKey, xmlPubKey) {

    var rsa = new chilkat.Rsa();

    var success = rsa.UnlockComponent("Anything for 30-day trial");
    if (success !== true) {
        console.log("RSA component unlock failed");
        return;
    }

    // Import private key from xml provided
    rsa.ImportPrivateKey(xmlPrivKey);

    // Encrypt passphrase with private key
    var encryptedPassphrase = rsa.EncryptStringENC(passphrase, true);
    console.log(encryptedPassphrase);

    // Import private key from xml provided
    rsa.ImportPublicKey(xmlPubKey);

    // Encrypt passphrase with private key
    var decryptedPassphrase = rsa.DecryptStringENC(encryptedPassphrase, false);
    console.log(decryptedPassphrase);

}

encrypt("Olivia", "<RSAKeyValue><Modulus>rjV3lSVL/uu4TOfjXcdCsUxk5uLWge9jIY/Gq3Vi+NKJa3YXGMxxoO3tu1ANsWT69JFRt0Raevni7X2hCYjk/e/bRRvLmQff6SZXuH/Tm20es8NZViDyShYaIn46Bx8G+Sk/WYigYjQq0qQnPfy32Dr8iO5Q0LSv34Ulck6dHlk=</Modulus><Exponent>AQAB</Exponent><D>AzNQQxkwUDqcZC1ObAahHwi8QdGhBzoSpCc0CypY6yFTDPpaakY3QDGe0HYkCkJEqgGRcsB6uQ+mL57DOp2dN1VMEIkyS4bZrF1OR/ca+aZse3oglI7rGgMIezhYjy49/esE8ryTEAo0Zf4iWvdt1w2XpXUouGfSzdzaEO76sJE=</D><P>wxLuizDV8AEMeiSM0xp1dPLVDF76HK4m5CRq0ddcoZN5Ncz0B4IJvioLUeMt3xTB0oR1O/kQDqfHuo37RjVLFw==</P><Q>5J5GIyOJ3cgQxSb+TbFVTMSONopfhnb4N2IaJ8EsBUgXH+nxg0mXINwqSomR3NPjf7WDyotM3Xtm9ftxtSMIDw==</Q><DP>bINTfsojt+ZdcnRygdvuCqgqKz+KEfouWCqJ4UDTnm3St0LTXHnRwZ7RvTOKiNWbG+fi7wGVFRHv4K6qYFu08Q==</DP><DQ>aB/yP+Ta0QljIfhdkNM4z4siXpLtaRfce5UR5pNj0lAAQEfT+QDWdV/xXxuDNLnI/wyUJvcFHkcrINPR+TcoXw==</DQ><InverseQ>vGwK/OJsI3haLFQ8EbrQgozr7G0KdLgLutlB+j6cyMzVsk9vcpavGmc7sg6F1JSs9yroSqiCAKh8GFOh1jtBMw==</InverseQ></RSAKeyValue>",
"<RSAPublicKey><Modulus>y9a9JN3tW/c9Ee5uMkmIdJ+u/pDjMWqGIpuUKsfdoNjB4et4+RK+FdjBsOsQ5jvlCjAsRwGNiD5yPcBgXSX+hja3jvG2LkKgHKR27bKcKJMEDEFvrCeugQJTcYeEshWVHK0vTcKzY9kFIbSDYZ/5J/7FJC7DB0utHnuUpaJjxYM=</Modulus><Exponent>AQAB</Exponent></RSAPublicKey>");
