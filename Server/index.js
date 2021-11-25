
var mysql = require('mysql');
const express = require('express');
const app = express()

const port = 3000;

var con = mysql.createConnection({
    host: "localhost",
    database: "workshop_ios",
    port:8889,
    user: "root",
    password: "root"
});
  
con.connect(function(err) {
    if (err) throw err;
    console.log("DB Connected!");
});

app.get('/add', (req, res) => {
    const {name} = req.query
    var sql = "INSERT INTO movies (name) VALUES ('" + name + "')";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
        res.json(200);
    });
    
})

app.get('/remove', (req, res) => {
    const {name} = req.query
    var sql = "DELETE FROM movies WHERE name LIKE '"+name+"'";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("1 record deleted");
        res.json(200);
    });
    
})

app.get('/getAll', (req, res) => {
    var sql = "SELECT * from movies";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("get all");
        res.json(result);
    });
})

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})

