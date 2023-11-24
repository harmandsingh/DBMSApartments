import React from "react";
import { useEffect } from "react";
import { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import { ServerUrl } from "../App";

const Employee = () => {
  const [employees, setEmployees] = useState([]);

  useEffect(() => {
    const fetchAllBooks = async () => {
      try {
        const res = await axios.get(ServerUrl + "employee");
        setEmployees(res.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchAllBooks();
  }, []);

  console.log(employees);

  const handleDelete = async (id) => {
    try {
      await axios.delete(`http://localhost:8800/employee/${id}`);
      window.location.reload();
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div>
      <h1>DBMS Apartments</h1>
      <div className="employees">
        {employees.map((employee) => (
          <div key={employee.employee_id} className="employee">
            <h2>
              {employee.first_name} {employee.last_name}
            </h2>
            <p>{employee.role}</p>
            <p>{employee.hire_date}</p>
            <p>{employee.active === 1 ? "Active" : "Not Active"}</p>
            <button
              className="delete"
              onClick={() => handleDelete(employee.employee_id)}
            >
              Delete
            </button>
            &nbsp;&nbsp;
            <button className="update">
              <Link
                to={`/update/${employee.employee_id}`}
                style={{ color: "inherit", textDecoration: "none" }}
              >
                Update
              </Link>
            </button>
          </div>
        ))}
      </div>

      <button className="addHome">
        <Link to="/add" style={{ color: "inherit", textDecoration: "none" }}>
          Add New Employee
        </Link>
      </button>
    </div>
  );
};

export default Employee;
