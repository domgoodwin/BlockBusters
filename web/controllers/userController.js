// var user = require('..web/models/user.js');
var db = require('../db/dydbInterface.js');
var keyTools = require('../db/keyTools.js');


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
    var key = keyTools.generateKeyPair();
    var pubKey = key.public;
    var privateKey = key.private;

    db.GetNextUserID(function(maxID){
      db.InsertUser(maxID, pubKey, req.body.passphrase, req.body.name, address);
    });
    res.render('success', {params: {key: privateKey}});
};

// Display Author create form on GET
exports.user_success_get = function(req, res) {
    res.render('success', { title: 'Successful'});
};

// Handle Author login on POST
exports.user_login_post = function(req, res) {
    res.send('NOT IMPLEMENTED: Login POST');
};
