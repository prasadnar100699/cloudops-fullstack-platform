import React, { useEffect, useState } from "react";

function App() {

  const [users, setUsers] = useState([]);
  const [name, setName] = useState("");

  useEffect(() => {

    fetch("/api/users")
      .then(res => res.json())
      .then(data => setUsers(data));

  }, []);

  const addUser = async () => {

    await fetch("/api/users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name })
    });

    setName("");
    window.location.reload();
  };

  return (
    <div style={{ padding: "40px" }}>

      <h1>CloudOps Platform 🚀</h1>

      <input
        value={name}
        onChange={e => setName(e.target.value)}
        placeholder="Enter name"
      />

      <button onClick={addUser}>Add</button>

      <h3>Users</h3>

      <ul>
        {users.map(u => (
          <li key={u.id}>{u.name}</li>
        ))}
      </ul>

    </div>
  );
}

export default App;
