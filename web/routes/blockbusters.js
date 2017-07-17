var express = require('express');
var router = express.Router();

// Require controller modules
var user_controller = require('../controllers/userController');
var vote_controller = require('../controllers/voteController');

var world = function(){
    console.log("It's working! :D");
    return "It's working!";

}

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', {world: world });
});

/* GET request for creating a user.*/
router.get('/create', user_controller.user_create_get);

/* POST request for creating user. */
router.post('/create', user_controller.user_create_post);

/*GET request for logging in. */
router.get('/login', user_controller.user_login_get);

/*GET request for successfully registering */
router.get('/success', user_controller.user_success_get);

/*POST request for logging in. */
router.post('/login', user_controller.user_login_post);

/* GET request for creating a vote.*/
router.get('/createvote', vote_controller.user_createvote_get);

/* POST request for creating vote. */
router.post('/createvote', vote_controller.user_createvote_post);

/* GET request for creating a vote.*/
router.get('/voteconfirm', vote_controller.user_voteconfirm_get);


/* GET request for creating a vote.*/
router.get('/displayvote', vote_controller.user_displayvote_get);

/* POST request for creating vote. */
router.post('/displayvote', vote_controller.user_displayvote_post);

module.exports = router;
