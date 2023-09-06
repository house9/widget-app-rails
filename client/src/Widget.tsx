import { useEffect, useState } from "react";

function Widget() {
  const [widgets, setWidgets] = useState([]);

  useEffect(() => {
    fetch("/api/widgets")
      .then((res) => res.json())
      .then((data) => {
        setWidgets(data.widgets);
      });
  }, []);

  return (
    <>
      <div className="card">
        Widget Count from Rails server: {widgets?.length}
      </div>
    </>
  );
}

export default Widget;
