- https://cloud.google.com/iam/docs/granting-changing-revoking-access
- https://cloud.google.com/iam/docs/manage-access-other-resources
- https://cloud.google.com/iam/docs/resource-types-with-policies

- Access is granted through Allow Policies aka IAM policies.
- Each Allow Policy contains a collection of role bindings that associate one or more principals with IAM role.
- These role bindings grant the specified roles to the principals, both on the resource that allow policy is attached
  to and on all of the resource's descendants.
- To manage access to a resource, you need permissions to get the resource, and to get and set the allow policy for the resource.
    - **SERVICE.RESOURCE_TYPE.get**
    - **SERVICE.RESOURCE_TYPE.getIamPolicy**
    - **SERVICE.RESOURCE_TYPE.setIamPolicy**
- Example:
    - compute.instances.get
    - compute.instances.getIamPolicy
    - compute.instances.setIamPolicy
- Ask your administrator to grant you a predefined or custom role that includes the permissions.
- For example, your administrator could grant you the Security Admin role (**roles/iam.securityAdmin**),
  which includes permissions to manage access to almost all Google Cloud resources.
- **Note:** When you try to view resource's allow policy, it will not show any roles gained through policy inheritance.
- **Note:** In general, policy changes take effect within 2 minutes. However, in some cases, it can take 7 minutes or more for changes to propagate across the system.
- To get the allow policy for the resource, run the get-iam-policy command for the resource.
```
gcloud projects get-iam-policy my-project-1509295317174
bindings:
- members:
  - user:abc@gmail.com
  role: roles/compute.securityAdmin
- members:
  - user:xyz@gmail.com
  role: roles/owner
- members:
  - user:abc@gmail.com
  role: roles/viewer
etag: BwX2dqBjloA=
version: 1
```