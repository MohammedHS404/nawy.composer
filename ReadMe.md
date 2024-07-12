# Docker Compose
## db
- Runs a SQL Server instance with user `sa` and password `Mario1234!
- Exposes port 1433 internally for sibling services and 1313 externally for host access
## migrate
- Runs Prisma migrations after waiting for the db to be ready
- Exposes no ports
## api
- Runs a Node.js NestJS server with Prisma client
- Exposes port 5000 internally for sibling services and 5000 externally for host access
- Depends on db and migrate services
- poolTimeout=60 is set in the Prisma client to avoid connection timeouts till the db is ready
# Running
- Run `docker-compose up` to start all services
- Wait 10-15 seconds for the db to be ready
- Open http://localhost:5000/api in your browser to access the API
- Run `docker-compose down` to stop all services