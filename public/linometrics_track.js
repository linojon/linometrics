  var linometrics_track = function (site, name, property_1, property_2){
    var _bm_event = {
      site: site,
      event: {
        name: name,
        property_1: property_1,
        property_2: property_2
      }
    }

    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "http://localhost:3000/events.json", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');
    _bm_request.onreadystatechange = function() {};
    _bm_request.send(JSON.stringify(_bm_event));
  };
