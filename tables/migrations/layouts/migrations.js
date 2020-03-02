class Migration {
    setup(options, seedLink) {
        dbm = options.dbmigrate;
        type = dbm.dataType;
        seed = seedLink;
        Promise = options.Promise;
    };

    up(db) {
        return new Promise(function (resolve, reject) {
            fs.readFile(filePath, { encoding: 'utf-8' }, function (err, data) {
                if (err) return reject(err);
                console.log('received data: ' + data);

                resolve(data);
            });
        })
            .then(function (data) {
                return db.runSql(data);
            });
    };

    down(db) {
        return new Promise(function (resolve, reject) {
            fs.readFile(filePath, { encoding: 'utf-8' }, function (err, data) {
                if (err) return reject(err);
                console.log('received data: ' + data);

                resolve(data);
            });
        })
            .then(function (data) {
                return db.runSql(data);
            });
    };
}

module.exports = new Migration