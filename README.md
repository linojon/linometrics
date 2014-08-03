# README

To demo,

```
linometrics$ bin/rails server
```

browse to localhost:3000, create a site "linometrics-client"

```
linometrics-client$ bin/rails server -p 3001
```

browse to "localhost:3001/" or "localhost:3001/about"


## Client

Add to page head

```
<script src="http://localhost:3000/linometrics_track.js"></script>
```

You can track click events as follows

```
<a href="/about", onclick="linometrics_track('linometrics-client', 'click', 'a value', 'another value');">About</a>
```

You can track page loads, add to bottom of body

```
<script>
  linometrics_track( 'linometrics-client', 'pageload', 'some value', 'some other value');
</script>
```

