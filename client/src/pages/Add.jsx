import axios from "axios";
import React from "react";
import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const Add = () => {
  const [employee, setEmployee] = useState({
    first_name: "",
    last_name: "",
    role: "",
    hire_date: Date.now,
    active: true,
  });
  const [error, setError] = useState(false);

  const navigate = useNavigate();

  const handleChange = (e) => {
    setEmployee((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleClick = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:8800/employee", employee);
      navigate("/");
    } catch (err) {
      console.log(err);
      setError(true);
    }
  };

  return (
    <div className="form">
      <h1>Add New Employee</h1>
      <input
        type="text"
        placeholder="Employee First Name"
        name="first_name"
        onChange={handleChange}
      />
      <input
        type="text"
        placeholder="Employee Last Name"
        name="last_name"
        onChange={handleChange}
      />
      <input
        type="text"
        placeholder="Employee Role"
        name="role"
        onChange={handleChange}
      />
      {/* <input
        type="text"
        placeholder="Employee Hire Date"
        name="hireDate"
        onChange={handleChange}
      />
      <input
        type="boolean"
        placeholder="Active"
        name="active"
        onChange={handleChange}
      /> */}
      <button onClick={handleClick}>Add</button>
      {error && "Something went wrong!"}
      <Link to="/">See all Employees!</Link>
    </div>
  );
};

export default Add;
