import React from "react";

import classNames from "classnames";
import { PageLoader, Tooltip, Typography } from "neetoui";
import { isNil } from "ramda";
import Truncate from "react-truncate";

import { useFetchAdmin } from "hooks/reactQuery/useAdminApi";

const Dashboard = () => {
  const {
    data: { cabs = [], totalTrips = "", totalFareEarned = "" } = {},
    isLoading,
  } = useFetchAdmin();

  const totalFare = isNil(totalFareEarned) ? 0 : totalFareEarned;

  if (isLoading) {
    return (
      <div className="h-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <>
      <div className="flex flex-col items-end p-10 text-lg font-bold">
        <Typography>Total completed trips: {totalTrips}</Typography>
        <Typography className="mt-4">
          Total fares earned: {totalFare}
        </Typography>
      </div>
      <div className="mx-auto mt-28 flex flex-wrap justify-center">
        {cabs.map(cab => (
          <div
            className="mx-2 w-full p-4 sm:w-1/2 md:w-1/3 lg:w-1/4"
            key={cab.id}
          >
            <div className="flex h-full flex-col">
              <a className="flex h-full max-w-sm flex-col rounded-lg border border-gray-200 bg-white p-6 shadow hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
                <Typography className="mb-3 font-bold">{cab.title}</Typography>
                <div
                  className={classNames(
                    "flex w-2/5 justify-center rounded-md text-xs",
                    {
                      "bg-yellow-300": !cab.isAvailable,
                      "bg-green-500": cab.isAvailable,
                    }
                  )}
                >
                  {cab.isAvailable ? "Cab available" : "Ride in progress"}
                </div>
                <div className="mt-5 flex-1">
                  <Tooltip
                    content={cab.currentLocation}
                    followCursor="horizontal"
                    position="top"
                  >
                    <b>Current location: </b>
                    <Truncate ellipsis={<span>...</span>} lines={1}>
                      {cab.currentLocation}
                    </Truncate>
                  </Tooltip>
                </div>
              </a>
            </div>
          </div>
        ))}
      </div>
    </>
  );
};

export default Dashboard;
