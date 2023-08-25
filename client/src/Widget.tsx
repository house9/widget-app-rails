import { useEffect, useState } from "react";

function Widget() {
  const [widgets, setWidgets] = useState([]);

  useEffect(() => {
    fetch("/api/widgets")
      .then((res) => res.json())
      .then((data) => {
        setWidgets(data);
      });
  }, []);

  return (
    <>
      <div className="card">Widget Count: {widgets?.length}</div>
    </>
  );
}

export default Widget;
