import cluster from 'cluster';

import { cpus } from 'os';
import express from 'express';

const { length: numCPUs } = cpus();

const app = express();

app.get('/:name?', function (req, res) {
    const name = req.params.name;
    if (name) {
        return res.send(`Hello ${name}!!!`);
    } else {
        console.log(process.pid, 222);
        return res.send('Hello ');
    }
});


// if (cluster.isMaster) {
// 	masterProcess();
// } else {
// 	childProcess();
// }

// function masterProcess() {
// 	console.log(`Master ${process.pid} is running`);

// 	for (let i = 0; i < numCPUs; i++) {
// 		console.log(`Forking process number ${i}...`);
// 		cluster.fork();
// 	}
// }

// function childProcess() {
// 	console.log(`Worker ${process.pid} started...`);

// 	app.listen(3000, function () {
// 		console.log(`App listening ${process.pid} on port 3000!`);
// 	});
// }


app.set('port', process.env['PORT'] || 2442);

if (cluster.isMaster) {
    // master start
    console.log('start master...');
    // 遍历 fork worker
    for (let i = 0; i < numCPUs; i++) {
        const worker = cluster.fork();
        worker.send('[master] ' + 'hi worker' + worker.id);
    }
    // 进行fork
    cluster.on('fork', function (worker) {
        console.log(`Master fork: worker , worker id=${worker.id}, worker pid=${
            worker.process.pid
        }`);
    });
    // worker在线
    cluster.on('online', function (worker) {
        console.log(`worker-${worker.id} online ... `);
    });
    // worker监听
    cluster.on('listening', function (worker, address) {
        console.log(`listening: worker pid=${worker.process.pid}, address=127.0.0.1:${
            address.port
        }`);
    });
    cluster.on('exit', (worker, code, signal) => {
        console.log(`worker ${worker.process.pid} died`);
    });
} else {
    app.listen(app.get('port'));
}