# FINANCE MANAGEMENT RAILS API

Welcome to the Finance Management Rails API! This API provides functionality to manage income data for personal finance management..

## Table of Contents

- [Getting Started](#getting-started)
- [API Endpoints](#api-endpoints)

## Getting Started

To get started, follow these instructions to set up and run the Finance Management Rails API locally.

### Prerequisites

- Ruby: >= 3.2.0
- Rails: >= 7.0.0

### Installation

1. Clone this repository:

   ```sh
   git clone https://github.com/satrujit11/Finance-Management-API.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Finance-Management-API
   ```

3. Install dependencies:

   ```bash
   bundle install
   ```

4. Set up the database:

   ```bash
   rails db:create db:migrate
   ```

5. Start the Rails server:

   ```bash
   rails s
   ```

Now the API should be up and running at `http://localhost:3000`.

## API Endpoints

The following endpoints are available for managing income data:

- `GET /api/v1/incomes?user_id=<specific_user_id>`: Get a list of all incomes.
- `GET /api/v1/incomes/:id?user_id=<specific_user_id>`: Get details of a specific income.
- `POST /api/v1/incomes`: Create a new income.
- `PUT /api/v1/incomes/:id?user_id=<specific_user_id>`: Update an existing income.
- `DELETE /api/v1/incomes/:id?user_id=<specific_user_id>`: Delete an income..
