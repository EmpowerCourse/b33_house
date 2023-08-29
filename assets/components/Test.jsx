import React, { useState } from "react";
import { api, helpers } from "../utils";

function Test() {
  const [houses, setHouses] = useState([]);
  const [message, setMessage] = useState({flavor: "info", text: "Please Log-In"});

  function filter(e) {
    console.log('here')
    e.preventDefault();
    api.post("houses", { filterName: "city", filterValue: "Greensboro"})
      .then((response) => {
        if (response.data) {
          
        } else {
          setMessage({flavor: "danger", text: "No results"});
        }
      }).catch(helpers.catchHandler);
  }
  console.info("melissa HOUSES", houses)
  return <div onClick={filter} className="filterBtn">This is a component</div>;
}

export default Test;
