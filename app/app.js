const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Hello devops!'));

app.listen(3000, '0.0.0.0', () => {
    console.log('Welcome devops!');
});