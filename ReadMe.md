# Docker Compose
## db
- Runs a SQL Server instance with user `sa` and password `Mario1234!
- Exposes port 1433 internally for sibling services and 1313 externally for host access
## migrate
- Runs Prisma migrations and seeding after waiting for the db to be ready
- Exposes no ports
## api
- Runs a Node.js NestJS server with Prisma client
- Exposes port 5000 internally for sibling services and 5000 externally for host access
- Depends on db and migrate services
- poolTimeout=60 is set in the Prisma client to avoid connection timeouts till the db is ready
# ui
- Runs a React app
- Exposes port 3000 internally for sibling services and 3000 externally for host access
- Depends on api service
# Running
- Run `docker-compose build` to build all services
- Run `docker-compose up` to start all services
- Wait 10-30 seconds for the db to be ready and the migrations to run (Open docker to monitor the services)
- Open http://localhost:5000/api in your browser to access the API
- Open http://localhost:3000 in your browser to access the UI
- You can also access the db using SQL Server Management Studio with the connection string `Server=localhost,1313;User Id=sa;Password=Mario1234!;trustServerCertificate=true;`
- Run `docker-compose down` to stop all services