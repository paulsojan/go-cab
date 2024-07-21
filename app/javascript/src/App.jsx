import React from "react";

import { QueryClientProvider } from "react-query";
import { BrowserRouter } from "react-router-dom";
import { ToastContainer } from "react-toastify";

import initializeAxios from "apis/axios";
import queryClient from "utils/queryClient";

import Main from "./components/Main";
// eslint-disable-next-line import/order
import "./common/i18n";

initializeAxios();
const App = () => (
  <QueryClientProvider client={queryClient}>
    <BrowserRouter>
      <ToastContainer />
      <Main />
    </BrowserRouter>
  </QueryClientProvider>
);

export default App;
