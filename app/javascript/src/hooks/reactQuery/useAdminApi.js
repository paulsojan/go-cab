import { useQuery } from "react-query";

import adminApi from "apis/admin";
import { QUERY_KEYS } from "constants/query";

export const useFetchAdmin = () => useQuery(QUERY_KEYS.ADMIN, adminApi.fetch);
