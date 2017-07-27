var rpc = require('json-rpc2');

var client = rpc.Client.$create(2763,'localhost', 'multichainrpc', '2oNT9TAGA6YedH6jwPYEfgycf9s65o7PvXSdBa5yEAtj');

// Call add function on the server

client.call('getblockchainparams', [], function(err, res) {
  if (err) {console.log(err + " : " + res.error.message);}
  else {console.log(res);}
  console.log('done');
});
