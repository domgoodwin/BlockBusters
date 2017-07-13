// var user = require('..web/models/user.js');
var db = require('../db/dydbInterface.js');
var keyTools = require('../db/keyTools.js');


// Display Author create form on GET
exports.user_createvote_get = function(req, res) {
    res.render('createvote', { title: 'Create Vote'});
};

// Handle Author login on POST
exports.user_createvote_post = function(req, res) {
    res.send('NOT IMPLEMENTED: Create vote POST');
};

// Display Author create form on GET
exports.user_displayvote_get = function(req, res) {
    res.render('displayvote', { title: 'Display Vote'});
};

// Handle Author login on POST
exports.user_displayvote_post = function(req, res) {
    var blockid = req.body.blockid;
    res.send('NOT IMPLEMENTED: Display vote POST' + blockid);
};
