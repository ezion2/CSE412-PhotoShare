import React from 'react';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>PhotoSource</h1>
        <div className="header-buttons">
          <button className="header-button" onClick={() => console.log('Login')}>Login</button>
          <button className="header-button" onClick={() => console.log('Signup')}>Signup</button>
        </div>
      </header>
      <main className="App-main">
        <p>Place Holder!</p>
      </main>
    </div>
  );
}

export default App;
