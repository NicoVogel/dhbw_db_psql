var express = require('express');
var app = express();
const psql = require('pg')
const connectionString = "postgresql://admin:admin@psql:5432?sslmode=disable"
const client = new psql.Client(connectionString);
client.connect();



app.get('/', function (req, res) {
    res.send('die views sind unter der url /v1 bis /v4 zu finden');
});

app.get('/v1', function (req, res) {
    fetchAllOfType(res, 'arzt_overview');
});

app.get('/v2', function (req, res) {
    fetchAllOfType(res, 'fachbereich_overview');
});

app.get('/v3', function (req, res) {
    fetchAllOfType(res, 'arzt_overview_time');
});

app.get('/v4', function (req, res) {
    fetchAllOfType(res, 'angestellten_overview');
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});

function fetchAllOfType(res, type) {
    var options = {
        sql: 'SELECT * FROM ' + type
    }
    console.log("query = " + options.sql);
    executeQuery(options, res, createViewTable);
}



function executeQuery(options, res, cb) {
    if (!options || !options.sql)
        throw (new Error('Invalid sql statement'));

    console.log("client is null: " + !client);
    client.query(options.sql, function (err, result, fields) {
        if (err) {
            console.log(err);
            throw err;
        }
        cb(res, result);
    });
}

const createViewTable = function (res, result) {
    res.write("<table>");
    res.write("<tr>");
    for (var field in result.fields) {
        res.write("<td><label>" + field.name + "</label></td>");
    }
    res.write("</tr>");
    /*
    for(var row in result.rows){
        res.write("<td><label>" + result[row][column] + "</label></td>");       
    }
    */
    for (var row in result.rows) {
        console.log(row);
    }
    res.write("</table>");
    res.end();
}