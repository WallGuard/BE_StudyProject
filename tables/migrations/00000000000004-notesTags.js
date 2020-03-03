const fs = require('fs');
const path = require('path');
const filePath_up = path.join(__dirname, 'sqls', 'table_NotesTags-up.sql');
const filePath_down = path.join(__dirname, 'sqls', 'table_NotesTags-down.sql');

exports.setup = function (options, seedLink) {
  dbm = options.dbmigrate;
  type = dbm.dataType;
  seed = seedLink;
  Promise = options.Promise;
};

exports.up = function (db) {
  return new Promise(function (resolve, reject) {
    fs.readFile(filePath_up, { encoding: 'utf-8' }, function (err, data) {
      if (err) return reject(err);
      console.log('received data: ' + data);

      resolve(data);
    });
  })
    .then(function (data) {
      return db.runSql(data);
    });
};

exports.down = function (db) {
  return new Promise(function (resolve, reject) {
    fs.readFile(filePath_down, { encoding: 'utf-8' }, function (err, data) {
      if (err) return reject(err);
      console.log('received data: ' + data);

      resolve(data);
    });
  })
    .then(function (data) {
      return db.runSql(data);
    });
};

exports._meta = {
  'version': 1
};
