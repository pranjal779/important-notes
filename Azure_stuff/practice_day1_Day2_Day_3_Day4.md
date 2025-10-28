# Day 1 - 2
🧭 Your Plan for Day 1–2 — Azure Foundations (Smart Path)
🎯 Goal:

[Quickstart: Deploy a Python (Django, Flask, or FastAPI) web app to Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/quickstart-python)

By the end of Day 2, you’ll know what each of these services is and how to use them practically:

Resource Group

App Service Plan

App Service

Storage Account

You’ll also deploy your first test website (even a “Hello from Azure” page).

🪜 Step-by-Step Approach
🔹 Step 1: Learn Concepts (Docs or Quick Videos)

Start with short Microsoft Learn docs or official overviews — they are clear and visual.
Use these pages:

Resource Group
👉 https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview

(Concept: it’s like a folder where all your Azure resources live together.)

App Service + App Service Plan
👉 https://learn.microsoft.com/en-us/azure/app-service/overview

(Think of App Service Plan as the “machine” and App Service as the “website” running on it.)

Storage Account
👉 https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview

(Used for files, logs, or static website hosting.)

Spend about 15–20 min per service reading or skimming the diagrams.

🔹 Step 2: Watch a Quick YouTube Tutorial (Visual Understanding)

After the docs, reinforce with visuals. Search or copy-paste these exact queries:

Azure Resource Group tutorial for beginners

Azure App Service and App Service Plan explained

Deploy website to Azure App Service step by step

Azure Storage Account tutorial

👉 Tip: Pick videos under 15 minutes. The channel “TechHut,” “Adam Marczak – Azure for Everyone,” or “Microsoft Azure” official are high-quality.

🔹 Step 3: Practice Hands-On (in Your Account)

Let’s make a small structure manually:

Create a Resource Group

Portal → Search “Resource Groups” → “Create”

Name: hackathon-rg

Region: pick something close (e.g., Central India or East US)

Create an App Service Plan

Portal → “App Service Plans” → “Create”

Name: hackathon-plan

Choose B1 or F1 (Free tier)

OS: Linux

Create an App Service (Web App)

Portal → “App Services” → “Create”

Link it to your Resource Group + App Service Plan

Runtime stack: Python 3.11

Region: same as your plan

Review + Create → Deploy
→ It will give you a .azurewebsites.net URL; open it to see your test site live.

Create a Storage Account

Name: hackathonstoragexyz (must be unique)

Region: same as RG

Tier: Standard LRS

Then explore containers → upload a small text file or image.

🔹 Step 4: Record Your Learnings

Make a small markdown or notebook entry:

What is a Resource Group?

What did I deploy?

How is App Service different from App Service Plan?

What command or step created my web app?

This helps later when officials ask “Why did you do this?”
------------------------

# Day 3 - 4
 💪
Let’s lock in **Days 3–4 (Azure DevOps + Terraform)** — this is where you’ll start *acting* like a real DevOps engineer: deploying, automating, and integrating code.

We’ll do this in two tracks:

1. **Track A:** Create and deploy a Flask app to Azure App Service using Azure DevOps CI/CD pipeline.
2. **Track B (optional but important):** Automate the resource creation (App Service + Resource Group + Storage) using Terraform.

---

## 🧱 **Track A: Azure DevOps CI/CD (Day 3–4 Core Project)**

### 🧩 Prerequisites

Make sure you have:

* Azure account ✅
* GitHub account ✅
* Azure DevOps account: [https://dev.azure.com](https://dev.azure.com) (Free signup)

---

### Step 1: Create a Simple Flask App

Make a folder named `flask-azure-demo` and create these files:

#### `app.py`

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Flask on Azure App Service!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
```

#### `requirements.txt`

```
Flask==2.3.2
```

#### `web.config`

*(For Azure App Service to understand Flask startup)*

```xml
<configuration>
  <system.webServer>
    <handlers>
      <add name="pythonApp" path="*" verb="*" modules="FastCgiModule" scriptProcessor="D:\home\Python364x64\python.exe|D:\home\site\wwwroot\app.py" resourceType="Unspecified" requireAccess="Script"/>
    </handlers>
  </system.webServer>
</configuration>
```

Then:

```bash
git init
git add .
git commit -m "Initial Flask app for Azure"
```

Push it to GitHub.

---

### Step 2: Create an Azure App Service via Portal

Go to **Azure Portal → App Services → Create**

1. Choose your **Resource Group** (create new if needed)
2. Runtime stack: **Python 3.9 or above**
3. Publish: **Code**
4. Region: any close to India (Central India / East Asia)
5. Review + Create → Deploy

This will create your app (you’ll see a default URL like `https://<app-name>.azurewebsites.net`).

---

### Step 3: Connect GitHub to Azure App Service (Easy CI/CD)

You can do CI/CD without touching Azure DevOps first.

Go to your App Service → **Deployment Center → GitHub**

* Authorize GitHub
* Select your repo and branch
* Azure will automatically create a **GitHub Actions workflow file** (YAML) that builds and deploys on every `git push`.

This is your **first automated pipeline** 🎉

---

### Step 4: Check Deployment

After GitHub Action finishes, refresh your site URL.
It should say:

> “Hello from Flask on Azure App Service!”

You now have a **working CI/CD pipeline from GitHub → Azure**.

---

## 🛠️ **Track B: Terraform on Azure (Automation Layer)**

Now that you’ve manually deployed once, let’s create the same setup using Terraform — this gives you **Infrastructure as Code (IaC)**.

### Step 1: Install Terraform (if not already)

Check:

```bash
terraform -version
```

If not installed:
👉 [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

### Step 2: Create Files

#### `main.tf` - 2 options for the code

##### file option 2 (which worked)

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
    resource_provider_registrations = "none"
    subscription_id =  "<insert Id here after running az account show>"
    features {}
}

resource "azurerm_resource_group" "practice_rg" {
    name = "rg-terraform-practice"
    location = "centralus"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "tf-appservice-plan"
  location            = azurerm_resource_group.practice_rg.location
  resource_group_name = azurerm_resource_group.practice_rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "tf-flask-webapp"
  location            = azurerm_resource_group.practice_rg.location
  resource_group_name = azurerm_resource_group.practice_rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id
}
```

##### file option 1 (original)

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-flask-demo"
  location = "Central India"
}

resource "azurerm_app_service_plan" "demo" {
  name                = "asp-flask-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "demo" {
  name                = "flask-webapp-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  app_service_plan_id = azurerm_app_service_plan.demo.id

  site_config {
    python_version = "3.9"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
```

---

### Step 3: Deploy Using Terraform

```bash
az login
terraform init
terraform plan
terraform apply -auto-approve
```

After it completes, go to the **Azure Portal → Resource Groups → rg-flask-demo → App Service**,
and you’ll see your web app created 🎯

---

### Step 4: Clean Up (After Practice)

Once you’re done:

```bash
terraform destroy
```

or delete the resource group manually in Azure Portal.

---

## 🎓 Summary (Interview + Hackathon Explanation)

If someone asks:

> “How did you deploy the application and why this approach?”

You can confidently say:

> “I deployed a Python Flask app on Azure App Service. Initially, I provisioned resources through the Azure Portal to understand the flow, and then automated it using Terraform for repeatability. I configured CI/CD using GitHub Actions integrated with Azure App Service so that any code change is automatically deployed. This setup demonstrates both manual provisioning and DevOps automation best practices.”

---

If you want, I can next write a **Day 5–7 plan** that adds:

* Monitoring (Application Insights),
* Azure DevOps Pipeline (instead of GitHub Actions),
* and connecting Terraform with Azure DevOps.

## Day 3 - 4 (2nd version)

For **Day 3 and 4**, your next focus is **Terraform on Azure** — learning Infrastructure‑as‑Code (IaC) and automating infrastructure provisioning. This bridges your AWS Terraform certification experience and solidifies your DevOps role for the hackathon.  

***

## **Goal for Day 3–4**
By the end of these two days, you should be able to:
1. Use **Terraform** to define and deploy Azure resources (like a Resource Group and App Service).  
2. Manage your infrastructure using IaC commands (`init`, `plan`, `apply`, `destroy`).  
3. Understand how Terraform authenticates and interacts with Azure through the AzureRM provider.[1][2][3]

***

## **Step‑by‑Step Plan**

### **Step 1 – Set up Terraform inside Azure Cloud Shell**
The Cloud Shell already includes Terraform installed by default.  
Test it with:
```bash
terraform -version
```

If you’re using your local system, follow Microsoft’s setup guide:
- [Install and Configure Terraform in Azure].[4]

***

### **Step 2 – Authenticate Terraform**
Terraform communicates with Azure using your CLI credentials.  
Run:
```bash
az login
```
Then verify:
```bash
az account show
```
This confirms your subscription.  

For automated practice, you can also create a **Service Principal**:
```bash
az ad sp create-for-rbac --name "tf-sp" --role Contributor --scopes "/subscriptions/<your-subscription-id>"
```
Export the following environment variables to authenticate Terraform:[3]
```bash
export ARM_CLIENT_ID=<appId>
export ARM_CLIENT_SECRET=<password>
export ARM_TENANT_ID=<tenantId>
export ARM_SUBSCRIPTION_ID=<subscriptionId>
```

***

### **Step 3 – Create your first Terraform project**
In your Cloud Shell home directory:
```bash
mkdir azure-tf-demo
cd azure-tf-demo
```

Create a file named **`main.tf`**:
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "practice_rg" {
  name     = "rg-terraform-practice"
  location = "centralus"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "tf-appservice-plan"
  location            = azurerm_resource_group.practice_rg.location
  resource_group_name = azurerm_resource_group.practice_rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "tf-flask-webapp"
  location            = azurerm_resource_group.practice_rg.location
  resource_group_name = azurerm_resource_group.practice_rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id
}
```

***

### **Step 4 – Initialize & Apply**
Run these core commands:
```bash
terraform init
terraform plan
terraform apply -auto-approve
```
Terraform will:
- Initialize provider plugins,  
- Show the execution plan, and  
- Deploy your resource group, plan, and App Service.[5][6]

Verify the resources in the Azure Portal under **Resource Groups → rg‑terraform‑practice**.

***

### **Step 5 – Clean Up**
After validating deployment:
```bash
terraform destroy -auto-approve
```
This deletes all created resources — a best practice for free‑tier accounts.

***

### **Optional Day 4 Extension: CI/CD Automation**
If you get comfortable with Terraform earlier:
- Build an **Azure DevOps Pipeline** that runs your Terraform script automatically.  
  Follow this guide to create a basic YAML pipeline in Azure DevOps for Python apps.[7][8]

Example snippet (`azure-pipelines.yml`):
```yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: TerraformInstaller@1
  inputs:
    terraformVersion: 'latest'

- script: terraform init
  displayName: 'Initialize Terraform'

- script: terraform apply -auto-approve
  displayName: 'Deploy Infrastructure'
```

***

## **Deliverables after Day 4**
- Terraform scripts deployed a Resource Group and App Service on Azure.  
- Basic mastery of `init`, `plan`, `apply`, and `destroy`.  
- Optional: YAML CI/CD pipeline deploying Terraform code automatically.  

This Day 3–4 plan mirrors official Azure Terraform tutorials and is ideal preparation before you start CI/CD and Python automation on Days 5–6.[2][3][7]

[1](https://developer.hashicorp.com/terraform/tutorials/azure-get-started)
[2](https://learn.microsoft.com/en-us/azure/developer/terraform/)
[3](https://www.datacamp.com/tutorial/terraform-on-azure)
[4](https://learn.microsoft.com/en-us/azure/developer/terraform/quickstart-configure)
[5](https://learn.microsoft.com/en-us/azure/developer/terraform/create-resource-group)
[6](https://k21academy.com/terraform-iac/create-vm-on-azure-using-terraform-quick-start/)
[7](https://spot.io/resources/ci-cd/azure-devops-pipeline-components-benefits-and-a-quick-tutorial/)
[8](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)
[9](https://spacelift.io/blog/terraform-azure)
[10](https://www.youtube.com/watch?v=j0mfH_7sR7k&vl=en-IN)
[11](https://docs.azure.cn/en-us/app-service/environment/creation-terraform)
[12](https://learn.microsoft.com/en-us/training/paths/terraform-fundamentals/)
[13](https://www.youtube.com/watch?v=HdMB2YCtVr4)
[14](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python?view=azure-devops)
[15](https://www.youtube.com/playlist?list=PLl4APkPHzsUUHlbhuq9V02n9AMLPySoEQ)
[16](https://spacelift.io/blog/terraform-azurerm-provider)
[17](https://learn.microsoft.com/en-us/azure/devops/pipelines/create-first-pipeline?view=azure-devops)
[18](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
[19](https://www.datacamp.com/tutorial/azure-pipelines)
[20](https://learn.microsoft.com/en-us/azure/app-service/deploy-azure-pipelines)

---------------------


