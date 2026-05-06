## 🏗️ Terraform Workflow

This section outlines the standard workflow for managing infrastructure using Terraform.

### 1. Initialize Terraform

```bash
terraform init
```

Initializes the working directory containing Terraform configuration files.

* Downloads required provider plugins
* Sets up the backend (if configured)
* Prepares the environment for deployment

---

### 2. Review Execution Plan

```bash
terraform plan -out=tfplan
```

Creates an execution plan showing what actions Terraform will take.

* Compares current infrastructure with configuration
* Displays resources to be created, updated, or destroyed
* Saves the plan to a file (`tfplan`) for later use

---

### 3. Apply Changes

```bash
terraform apply tfplan
```

Applies the changes defined in the execution plan.

* Executes actions in the saved plan file
* Provisions or updates infrastructure safely
* Ensures only reviewed changes are applied

---

### 4. Destroy Infrastructure

```bash
terraform destroy
```

Removes all resources managed by Terraform.

* Deletes infrastructure created by the configuration
* Useful for cleanup or tearing down environments

---

### 💡 Best Practices

* Always review the plan before applying changes
* Use version control for `.tf` files
* Store state securely (e.g., remote backends)
* Avoid running `apply` without a saved plan in production