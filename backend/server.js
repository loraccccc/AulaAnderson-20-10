import express from "express";
import cors from "cors";
import dontend from "dotenv";

configDotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.json({ message: "API Biblioteca funcionando" });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta em http://localhost:${PORT}`);
});