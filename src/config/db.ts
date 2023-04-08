const maridb = require('mariadb');
const pool = maridb.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT,
    connectionLimit: 1
});

async function execQuery(query : string) {
    let conn;
    try {
        conn = await pool.getConnection();
        var result = await conn.query(query);
    } catch (err) {
        throw err;
    } finally {
        if (conn) conn.end();
        return result;
    }
}

module.exports = { execQuery, pool };
