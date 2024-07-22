# GoCab

## Local Development Setup

First clone this repo.

Then install the [Node.js](https://nodejs.org/) version `v18.12` which we have
specified inside the `.node-version` file of this repo, using the following
command:

```
nvm install
```

Make sure that [yarn](https://yarnpkg.com/) is installed with it as well in your
system.

After `yarn` is installed, install the Node.js and Rails dependencies and also
seed the database, by running:

```
./bin/setup
```

Start the server by executing following command.

```
bundle exec rails server -p 3000
```

Visit http://localhost:3000 to view the Admin dashboard.

## API Documentation

## Bookings

| Endpoint         | Method | Description           |
| ---------------- | ------ | --------------------- |
| /api/v1/bookings | POST   | Creates a new booking |

**Request:**

> `cab_type` can be `regular` or `premium`.

```
{
    "booking": {
        "start_latitude": 10.015468,
        "start_longitude": 76.363913,
        "end_latitude": 10.024365,
        "end_longitude": 76.308730,
        "cab_type": "regular"
    }
}
```

**Response:**

```json
{
  "cab": {
    "is_available": false,
    "latitude": 10.024365,
    "longitude": 76.30873,
    "id": "cc0f6a78-9713-4b9b-a1c8-1a914bbd88f5",
    "cab_type": "regular",
    "created_at": "2024-07-22T10:01:13.923Z",
    "updated_at": "2024-07-22T10:33:33.430Z",
    "user_id": "2ee123de-9051-48cc-a3e3-50c0953c620a",
    "title": "Chevy Camero"
  },
  "booking_id": "6b1c3646-7d9f-4083-9879-1399dc754602"
}
```

## Complete ride

| Endpoint                      | Method | Description            |
| ----------------------------- | ------ | ---------------------- |
| /api/v1/bookings/{booking_id} | PUT    | Mark ride as completed |

**Response**

```json
{
  "amount_to_pay": 73.32
}
```

## Admin

| Endpoint      | Method | Description                                                       |
| ------------- | ------ | ----------------------------------------------------------------- |
| /api/v1/admin | GET    | List all cabs, their current location, trips & total fares earned |

**Response**

```json
{
  "cabs": [
    {
      "id": "ce1f190c-2807-49c5-86d1-df1b37063952",
      "cab_type": "regular",
      "is_available": false,
      "title": "Chevy Silverado",
      "current_location": "Grand Mall, Salem - Kochi - Kanyakumari Road, Edappally, Edapally - 682024, KL, India"
    },
    {
      "id": "cc0f6a78-9713-4b9b-a1c8-1a914bbd88f5",
      "cab_type": "regular",
      "is_available": true,
      "title": "Chevy Camero",
      "current_location": "Grand Mall, Salem - Kochi - Kanyakumari Road, Edappally, Edapally - 682024, KL, India"
    }
  ],
  "bookings": [
    {
      "id": "8126b72f-ac53-4427-bb3d-1c9cb1f25ab8",
      "start_latitude": 10.015468,
      "start_longitude": 76.363913,
      "end_latitude": 10.024365,
      "end_longitude": 76.30873,
      "fare": 73.32001,
      "status": "completed"
    },
    {
      "id": "6941e1e1-b880-495b-8537-8a0a687fedae",
      "start_latitude": 10.015468,
      "start_longitude": 76.363913,
      "end_latitude": 10.024365,
      "end_longitude": 76.30873,
      "fare": null,
      "status": "in_progress"
    }
  ],
  "total_trips": 2,
  "total_fare_earned": 146.64
}
```
