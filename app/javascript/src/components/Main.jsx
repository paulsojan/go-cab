import React from "react";

import { Switch, Route } from "react-router-dom";

import routes from "routes";

import Dashboard from "./Dashboard";

const Main = () => (
  <Switch>
    <Route exact component={Dashboard} path={routes.root} />
  </Switch>
);

export default Main;
