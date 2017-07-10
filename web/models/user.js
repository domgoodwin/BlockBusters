
function User(name, addressLine1, addressLine2, postcode, passphrase){
  this.name = name;
  this.addressLine1 = addressLine1;
  this.addressLine2 = addressLine2;
  this.postcode = postcode;
  this.passphrase = passphrase;

}

module.exports = User;
