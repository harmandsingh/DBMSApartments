import express from "express";
import mysql2 from "mysql2";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql2.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "mysql",
  database: "dbms_apartments",
});

app.get("/", (req, res) => {
  res.json("hello");
});

app.get("/employee", (req, res) => {
  const query = "SELECT * FROM EMPLOYEE";
  db.query(query, (err, data) => {
    if (err) {
      console.log(err);
      return res.status(500).json(err);
    }
    return res.status(200).json(data);
  });
});

app.post("/employee", (req, res) => {
  const query =
    "INSERT INTO EMPLOYEE (`first_name`, `last_name`, `role`, `hire_date`, `active`) VALUES (?)";

  const values = [
    req.body.first_name,
    req.body.last_name,
    req.body.role,
    req.body.hire_date,
    req.body.active,
  ];

  db.query(query, [values], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.status(201).json(data);
  });
});

app.delete("/employee/:id", (req, res) => {
  const employeeId = req.params.id;
  const query = "DELETE FROM EMPLOYEE WHERE employee_id = ?";

  db.query(query, [employeeId], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.status(200).json(data);
  });
});

app.put("/employee/:id", (req, res) => {
  const employeeId = req.params.id;
  const query =
    "UPDATE EMPLOYEE SET `first_name`= ?, `last_name`= ?, `role`= ?, `hire_date`= ?, `active`= ? WHERE id = ?";

  const values = [
    req.body.first_name,
    req.body.last_name,
    req.body.role,
    req.body.hire_date,
    req.body.active,
  ];

  db.query(query, [...values, employeeId], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.status(200).json(data);
  });
});

app.listen(8800, () => {
  console.log("Backend server started:");
});
