import "./App.css";
import "./Widget";
import Widget from "./Widget";

function App() {
  const railsUrl =
    process.env.NODE_ENV === "production" ? "/" : "http://localhost:3030/";

  return (
    <>
      <p className="read-the-docs">React SPA</p>
      <div>
        <Widget />
      </div>
      <p>
        <a href={railsUrl}>Back to Rails app</a>
      </p>
    </>
  );
}

export default App;
