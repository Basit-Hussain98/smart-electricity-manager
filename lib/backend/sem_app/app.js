const express = require('express');
const bodyParser = require('body-parser');

const mongoose = require('mongoose');



//database
mongoose.connect("mongodb://localhost:27017/semDB", { useNewUrlParser: true, useUnifiedTopology: true });

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: [true, "Please check your data entry. no name specified!"]
    },
    username: {
        type: String,
        required: [true, "Please check your data entry. no username specified!"]
    },
    email: {
        type: String,
        required: [true, "Please check your data entry. no email specified!"]
    },
    password: {
        type: String,
        required: [true, "Please check your data entry. no password specified!"]
    },
    role: {
        type: String,
        required: [true, "Please check your data entry. no password specified!"]
    }
});

const User = mongoose.model('User', userSchema);

//server

const app = express();
app.use(express.json()); //Used to parse JSON bodies
app.use(express.urlencoded());
//app.use(bodyParser.urlencoded({extended: true}));

app.post('/adduser', (req, res) => {
    console.log(req.body);
    const Name = req.body.name;
    const userName = req.body.username;
    const Email = req.body.email;
    const Password = req.body.password;
    const Role = req.body.role;
    User.find().or([{ username: userName  }, { email: Email }])
    .then(users => {
        let flag = false;
        if (users){
            console.log(users);
            users.forEach(user => {
                if(user.username === userName){
                    flag = true;
                    res.status(400).json({message: "username already exist"});
                    //res.write("username already exist");
                }
                else if(user.email === Email){
                    flag = true;
                    res.status(400).json({message: "email already exist"});
                    //res.write("email already exist");
                }
            });
        }
        if(flag === false){
            const newUser = new User ({
                name: Name,
                username: userName,
                email: Email,
                password: Password,
                role: Role
            });
            newUser.save();
            res.status(200).json({message: "user added"});
            //res.end("user added");
        }
        else {
            res.end();
        }
    })
    .catch(error => {
         console.log(error); 
        }
    );
    
});

app.listen(3000, () => {
    console.log("SEM app listening at http://192.168.10.9:3000/");
});