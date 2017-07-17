// var user = require('..web/models/user.js');
var db = require('../db/dydbInterface.js');
var keyTools = require('../db/keyTools.js');
var hash = require('crypto');


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


    db.GetNextUserID(function(maxID){
        var address = {line1: req.body.addressline1, line2: req.body.addressline2, postcode: req.body.postcode}
        var key = keyTools.generateKeyPair(req.body.keyname);
        var pubKey = key.public;
        var privateKey = key.private;
        db.InsertUser(maxID, pubKey, req.body.passphrase, req.body.name, address);
        res.render('success', {key: privateKey, title: 'User registered successfully'});
    });

};

// Display Author create form on GET
exports.user_success_get = function(req, res) {
    res.render('success', { title: 'Successful'});
};

// Handle Author login on POST
exports.user_login_post = function(req, res) {
  var post = req.body;
  var priv = req.body.privatekey;
  //console.log(req.body.passphrase);
  //var passphrase = keyTools.encryptStringWithPrivateKey(req.body.passphrase, privatekey);
  var passphrase = req.body.passphrase;
  db.login(passphrase, req.body.userid, priv, function(done){
    console.log("cont" + done);
    if (done) {
      // req.session.user_id = req.body.userid;
      // req.session.privatekey = req.body.privatekey;
      res.redirect('/blockbusters/createvote');
    } else {
      res.render('login', { info: 'Wrong login info', title:'Login'});
    }
  });

 };
