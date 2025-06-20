const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Hello Monokai!'));

app.listen(3000, '0.0.0.0', () => {
    console.log('Welcome Monokai!');
});