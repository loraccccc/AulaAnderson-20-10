import poll from "./db.js";
import bcrypt from bcryptjs;

//export async function name(params) {
    
//}

export async function createUser(nome, email, senha) {
    const senhaCriptografada = await bcrypt.hash(senha, 10);

    const querry = `
    INSERT INTO usuarios (nome, email, senha)
    VALUES ($1, $2, $3)
    RETURNING id, nome, email, criado_em;`;

    const values = [nome, email, senhaCriptografada];

    const resul = await poll.query(querry, values);
    return resul.rows[0];
}

export async function buscarUsuarioPorEmail(email) {
    const result = await poll.query("SELECT * FROM usuarios WHERE email = $1", [email]);  

    return result.rows[0];
}   
