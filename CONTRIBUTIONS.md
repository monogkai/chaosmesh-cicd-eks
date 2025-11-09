1. Deploy a node.js app using Kubernetes
    - ECR and EKS were already created in my AWS account
    - Some problems were faced during the deployment related to permissions to use kubectl in Kubernetes
2. Use terraform to generate the AWS resources
    - Use terraform to create the ECR and EKS
    - Delete resources in the end
    - Improve the workflow
3. Add Helm, Grafana and Prometheus
    - Divide terraform main.tf into multiple .tf files
    - Deploy App, Prometheus and Grafana using Helm
    - Use GitHub variables dynamically
    - Add validations
4. Add Chaos Mesh
    - Add an extra step to do chaos experiments
    - Add pod failure experiment
5. Use Terraform state
    - Save a S3 to store the terraform state file
    - Start to use terraform destroy, instead of running a script to delete each aws resource
    - Update workflow
6. Convert chaos step to access multiple experiments
    - Add cpu stress experiment
7. Generate the first Grafana graphics
    - Use Prometheus to obtain the data
    - Separate clean up job from the remaining workflow