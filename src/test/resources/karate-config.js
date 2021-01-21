function() {
	var config={}
	var env = karate.properties['karate.env'];
	karate.log('Environment test is running :'+env);
	karate.configure('connectTimeout',60000);
	karate.configure('readTimeout', 60000);
	//To run APIs in different environment, Base path can be added depending on environment
	if(env == 'Test'){
		config={
				url:'http://api.themoviedb.org/3/',
				env:'Test'
	    }
	} else if(env == 'Acceptance'){
		config={
				env:'Acceptance',
				url:'http://api.themoviedb.org/3/'
	    }
	} else {
		config={
				env:'Dev',
				url:'http://api.themoviedb.org/3/'
	    }
	}
	
  return config;
}
