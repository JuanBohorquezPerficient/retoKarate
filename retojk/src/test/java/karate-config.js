function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
	_url: 'https://demoqa.com',
	_login: '/login'

  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
  }
  return config;
}