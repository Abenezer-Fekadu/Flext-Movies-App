const express = require("express");
const morgan = require("morgan");
// Env Config
require("dotenv").config();
const PORT = process.env.PORT || 8000;

// Import Routes
const flixRoutes = require("./routes/flixhq");

// App
const app = express();

// Middleware
app.use(morgan("tiny"));

// Rotes Middle-ware
app.use("/api/flixhq", flixRoutes);

app.listen(PORT, () => console.log(`listening on port ${PORT}.....`));
