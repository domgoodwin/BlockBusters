// var user = require('..web/models/user.js');
var db = require('..lambda/dydbInterface.js')


// Display Author create form on GET
exports.user_create_get = function(req, res) {
    res.render('user_registration', { title: 'Create User' });
};

// Display Author create form on GET
exports.user_login_get = function(req, res) {
    res.render('login', { title: 'Login' });
};

// Handle Author create on POST
exports.user_create_post = function(req, res) {
    var address = {line1: req.body.addressline1, line2: req.body.addressline2, postcode: req.body.postcode}
    var pubKey = "abc123"
    db.insertUser(1, pubkey, req.body.passphrase, req.body.name, address);
};
// Handle Author login on POST
exports.user_login_post = function(req, res) {
    res.send('NOT IMPLEMENTED: Login POST');
};
