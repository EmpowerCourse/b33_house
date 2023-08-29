// assets/js/react-app.jsx
import React from "react";
import ReactDOM from "react-dom";
import App from "../App";

export default function renderApp(element) {
  ReactDOM.render(<App />, element);
}
