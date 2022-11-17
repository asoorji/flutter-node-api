var  mongoose = require('mongoose');

async function connect(){
    await mongoose.connect('mongodb+srv://test:test@todo.kxbpjhz.mongodb.net/test', {
        useNewUrlParser: true
    });
    console.log('Database connected!!!')
};

module.exports = { connect };