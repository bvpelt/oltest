# Introduction oltest
Openlayers 3 with application integration

links
- [closure-util](https://github.com/openlayers/closure-util)
- [closure tools](https://developers.google.com/closure/)
- [closure library](https://developers.google.com/closure/library/)
- [create openlayers project](http://openlayers.org/en/latest/doc/tutorials/browserify.html)
- [compiling app and openlayers](http://openlayers.org/en/latest/doc/tutorials/closure.html)


## Setup steps
After downloading the project first make sure building changes works by executing the following command from the command prompt in the directory of the oltest project.

```bash
$ make npminit
```

## Building the application
To build the application execute
```bash
$ make all
```
To test if the build is successfull execute
```bash
make debug
```
Goto the following link [http://localhost:3000](http://localhost:3000)

# FAQ
If an error message like below follows (bug in npm init) there are missing modules
```bash
[bvpelt@pluto oltest]$ make all
./node_modules/openlayers/node_modules/.bin/closure-util build config.json ./dist/app.js
make: ./node_modules/openlayers/node_modules/.bin/closure-util: Command not found
Makefile:23: recipe for target 'dist/app.js' failed
make: *** [dist/app.js] Error 127
```

This means, the google closure compiler is not installed, to fix this execute the commands below
```bash
[bvpelt@pluto oltest]$ cd node_modules/openlayers
[bvpelt@pluto oltest]$ npm install
```

