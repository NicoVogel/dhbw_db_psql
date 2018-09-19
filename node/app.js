var express = require('express');
var dateFormat = require('dateformat');
var app = express();
app.use(express.static('public'));
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
            console.log(JSON.stringify(err));
            throw err;
        }
        cb(res, result);
    });
}

const createViewTable = function (res, result) {
    let names = [];
    res.write('<link rel="stylesheet" href="/mui.min.css" type="text/css">')
    res.write("<table class='mui-table mui-table--bordered'>");
    res.write("<thead><tr>");
    for (let i = 0; i < result.fields.length; i++) {
        names[i] = { name: result.fields[i].name, format: result.fields[i].format };
        res.write("<th>" + result.fields[i].name + "</th>");
    }
    res.write("</tr></thead>");
    res.write("<tbody>");
    for (let i = 0; i < result.rows.length; i++) {
        let row = result.rows[i];

        res.write("<tr>");
        for (let j = 0; j < names.length; j++) {
            let val = row[names[j].name];
            if (names[j].format = 'date') {
                val = dateFormat(Date.parse(val), "dd.mm.yyyy");
            }
            res.write("<td><label>" + val + "</label></td>");
        }
        res.write("</tr>");
    }
    res.write("</tbody>");
    res.write("</table>");
    res.end();
}