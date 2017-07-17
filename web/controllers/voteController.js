// var user = require('..web/models/user.js');
var db = require('../db/dydbInterface.js');
var ch = require('../db/chainInterface.js');
var keyTools = require('../db/keyTools.js');


// Display Author create form on GET
exports.user_createvote_get = function(req, res) {
    res.render('createvote', { title: 'Create Vote'});
};

// Handle Author login on POST
exports.user_createvote_post = function(req, res) {
    var reply;
    ch.castVote("test", function(cb){
     //res.send('VOTE CAST: ' + cb.toString());
      res.render('voteconfirm', { info: cb.toString()});
    });

};

exports.user_voteconfirm_get = function(req, res) {
    res.render('voteconfirm', { title: 'Display Vote'});
}

// Display Author create form on GET
exports.user_displayvote_get = function(req, res) {
    res.render('displayvote', { title: 'Display Vote'});
};

// Handle Author login on POST
exports.user_displayvote_post = function(req, res) {
    var blockid = req.body.blockid;
    ch.getVote("july-2017", blockid, function(cb){
        res.send('VOTE CAST: ' + cb.toString());
    })
};
