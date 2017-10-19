var http = require('http');
var meta = require('./modulo1');


//res é o que recebe o browser
//é o que é enviado para o servidor
http.createServer(function (req, res) { //recebe dois argumentos, dados do pedido e resposta
    res.writeHead(200,{'Content-Type': 'text/html; charset=utf-8'}); //Cabeçalho da resposta
    res.write("<p>" + "Criado com node.js por: " + meta.myName() + " em " + meta.myDateTime() + "</p>");
    res.end(); //Termina a resposta

    // console.log('Servidor à escuta na porta 7777');
    // console.dir(req)
}).listen(7777); //Porta que irá escutar no servidor