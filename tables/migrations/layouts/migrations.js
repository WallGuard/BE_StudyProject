const fs = require('fs');

exports.setup = function(options, seedLink) {
    this.dbm = options.dbmigrate;
    this.type = dbm.dataType;
    this.seed = seedLink;
    Promise = options.Promise;
  };
  
  exports.up = function(db, filePath) {
    return new Promise( function( resolve, reject ) {
      fs.readFile(filePath, {encoding: 'utf-8'}, function(err,data){
        if (err) return reject(err);
        console.log('received data: ' + data);
  
        resolve(data);
      });
    })
    .then(function(data) {
      return db.runSql(data);
    });
  };
  
  exports.down = function(db) {
    return new Promise( function( resolve, reject ) {
      fs.readFile(filePath, {encoding: 'utf-8'}, function(err,data){
        if (err) return reject(err);
        console.log('received data: ' + data);
  
        resolve(data);
      });
    })
    .then(function(data) {
      return db.runSql(data);
    });
  };
  