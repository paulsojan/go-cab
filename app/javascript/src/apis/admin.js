import axios from "axios";

const fetch = () => axios.get("api/v1/admin");

const adminApi = { fetch };

export default adminApi;
