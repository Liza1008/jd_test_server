# JD Test Server

A Go-based server application with Docker and Terraform deployment support.

## Prerequisites

- Go 1.24.0 or later
- Docker
- Terraform
- AWS CLI (for AWS infrastructure deployment)
- AWS credentials configured

## Project Structure

```
jd_test_server/
├── cmd/            # Application entry points
├── src/            # Source code
├── terraform/      # Infrastructure as Code
├── Dockerfile      # Container configuration
└── go.mod          # Go module definition
```

## Local Development

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd jd_test_server
   ```

2. Install dependencies:
   ```bash
   go mod download
   ```

3. Run the server locally:
   ```bash
   go run cmd/main.go
   ```

## Docker Deployment

1. Build the Docker image:
   ```bash
   docker build -t jd-test-server .
   ```

2. Run the container:
   ```bash
   docker run -p 8080:8080 jd-test-server
   ```

## Infrastructure Deployment (AWS)

The project uses Terraform for infrastructure management. The infrastructure configuration is located in the `terraform/` directory.

1. Navigate to the Terraform directory:
   ```bash
   cd terraform
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the planned changes:
   ```bash
   terraform plan
   ```

4. Apply the infrastructure changes:
   ```bash
   terraform apply
   ```

### Infrastructure Components

The Terraform configuration includes:
- ECS cluster (depending on configuration)
- Load balancer
- Other AWS resources as defined in the Terraform files

### Variables

The following variables can be customized in `terraform/variables.tf`:
- `environment`: Deployment environment (e.g., dev, staging, prod)
- `region`: AWS region for deployment
- `instance_type`: EC2 instance type (if applicable)
- Other variables as defined in the configuration



## Cleanup

To remove deployed resources:

1. Navigate to the Terraform directory:
   ```bash
   cd terraform
   ```

2. Destroy the infrastructure:
   ```bash
   terraform destroy
   ```

## Troubleshooting

1. Check application logs for errors
2. Verify AWS credentials and permissions
3. Ensure all required ports are open in security groups
4. Review Terraform state for any failed deployments


## go version

go 1.24

## Port

Application reads the port from `JD_TEST_PORT` environment variable.
If not set, it defaults to `8080`.

To run the application locally, run:

```bash
JD_TEST_PORT=8081 go run ./cmd/main.go
```

## Endpoints

There are 4 endpoints:

1. `GET /health` - returns 200 OK if the server is running.
2. `GET /crash` - crashes the server immediately.
3. `GET /load/cpu?duration=10s&intensity=5` - starts a CPU load for the specified duration and intensity.
4. `GET /load/memory?duration=10s&intensity=5` - starts a memory load for the specified duration and intensity.
